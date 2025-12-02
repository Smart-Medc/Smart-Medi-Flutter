import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/utils/app_colors.dart';

class GenderSelectionField extends StatefulWidget {
  const GenderSelectionField({
    super.key,
    this.onGenderChanged,
    this.initialGender,
  });

  final Function(String)? onGenderChanged;
  final String? initialGender;

  @override
  State<GenderSelectionField> createState() => _GenderSelectionFieldState();
}

class _GenderSelectionFieldState extends State<GenderSelectionField> {
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    _selectedGender = widget.initialGender;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedGender = 'Male';
            });
            widget.onGenderChanged?.call('Male');
          },
          child: Row(
            children: [
              Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _selectedGender == 'Male'
                        ? AppColors.primaryLightMode
                        : AppColors.formFieldStrokeColor,
                    width: 2,
                  ),
                ),
                child: _selectedGender == 'Male'
                    ? Center(
                        child: Container(
                          width: 14.w,
                          height: 14.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryLightMode,
                          ),
                        ),
                      )
                    : null,
              ),
              SizedBox(width: 8.w),
              Text(
                'Male',
                style: AppStyles.textStyle16W400Black,
              ),
            ],
          ),
        ),
        32.horizontalSpace,
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedGender = 'Female';
            });
            widget.onGenderChanged?.call('Female');
          },
          child: Row(
            children: [
              Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _selectedGender == 'Female'
                        ? AppColors.primaryLightMode
                        : AppColors.formFieldStrokeColor,
                    width: 2,
                  ),
                ),
                child: _selectedGender == 'Female'
                    ? Center(
                        child: Container(
                          width: 14.w,
                          height: 14.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryLightMode,
                          ),
                        ),
                      )
                    : null,
              ),
              SizedBox(width: 8.w),
              Text(
                'Female',
                style: AppStyles.textStyle16W400Black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
