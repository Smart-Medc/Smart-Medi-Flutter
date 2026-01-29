import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  // ------------------------------------------------------------
  //                      Named Constructors
  // ------------------------------------------------------------

  /// Password field constructor
  const CustomTextFormField.password({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
  })  : isPassword = true,
        isDate = false,
        isDropdown = false,
        dropdownItems = null;

  /// Date picker field constructor
  const CustomTextFormField.date({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
  })  : isPassword = false,
        isDate = true,
        isDropdown = false,
        dropdownItems = null;

  /// Dropdown field constructor
  const CustomTextFormField.dropdown({
    super.key,
    required this.hintText,
    required this.controller,
    required this.dropdownItems,
    this.validator,
  })  : isPassword = false,
        isDate = false,
        isDropdown = true;

  // ------------------------------------------------------------
  //                Default main constructor
  // ------------------------------------------------------------
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.isPassword = false,
    this.isDate = false,
    this.isDropdown = false,
    this.dropdownItems,
  });

  final String hintText;
  final bool isPassword;
  final bool isDate;
  final bool isDropdown;

  final TextEditingController controller;
  final String? Function(String?)? validator;

  final List<String>? dropdownItems;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscured = true;
  bool _dropdownOpen = false;
  String? _selectedValue;

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      widget.controller.text = picked.toString().split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          readOnly: widget.isDate || widget.isDropdown,
          obscureText: widget.isPassword ? _isObscured : false,
          onTap: () {
            if (widget.isDropdown) {
              setState(() => _dropdownOpen = !_dropdownOpen);
            }
            if (widget.isDate) _pickDate();
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: AppStyles.textStyle12W400DarkGrey,
            filled: true,
            fillColor: AppColors.formFieldBGColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.formFieldStrokeColor,
                width: 1.sp,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.formFieldStrokeColor ,
                width: 1.sp,
              ),
            ),

            // suffix icon
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                _isObscured ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () =>
                  setState(() => _isObscured = !_isObscured),
            )
                : widget.isDate
                ? const Icon(Icons.calendar_today)
                : widget.isDropdown
                ? AnimatedRotation(
              turns: _dropdownOpen ? 0.5 : 0,
              duration: const Duration(milliseconds: 200),
              child: const Icon(Icons.keyboard_arrow_down),
            )
                : null,
          ),
        ),

        // Dropdown menu
        if (widget.isDropdown && _dropdownOpen)
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 4.h),
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xffD0D0D0).withAlpha(88),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.dropdownItems!
                  .map(
                    (item) => InkWell(
                  onTap: () {
                    setState(() {
                      _selectedValue = item;
                      widget.controller.text = item;
                      _dropdownOpen = false;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),
                    child: Text(
                      item,
                      style: AppStyles.textStyle14W400Black,
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ),
      ],
    );
  }
}
