import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/custom_text_form_field.dart';

class LabeledFormField extends StatelessWidget {
  const LabeledFormField({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.isRequired = false,
    this.isDate = false,
    this.isDropdown = false,
    this.dropdownItems,
  });

  final String label;
  final TextEditingController controller;
  final String hintText;
  final bool isRequired;
  final bool isDate;
  final bool isDropdown;
  final List<String>? dropdownItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: AppStyles.textStyle14W400Black,
            children: isRequired
                ? [
                    TextSpan(
                      text: ' *',
                      style: AppStyles.textStyle14W400Black.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ]
                : [],
          ),
        ),
        8.verticalSpace,
        if (isDate)
          CustomTextFormField.date(
            controller: controller,
            hintText: hintText,
          )
        else if (isDropdown)
          CustomTextFormField.dropdown(
            controller: controller,
            hintText: hintText,
            dropdownItems: dropdownItems ?? [],
          )
        else
          CustomTextFormField(
            controller: controller,
            hintText: hintText,
          ),
      ],
    );
  }
}

