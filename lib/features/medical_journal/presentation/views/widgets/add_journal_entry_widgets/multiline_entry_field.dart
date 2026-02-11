import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

/// A multiline text field widget for journal entry input
class MultilineEntryField extends StatelessWidget {
  const MultilineEntryField({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.isRequired = false,
    this.maxLines = 5,
  });

  final String label;
  final TextEditingController controller;
  final String hintText;
  final bool isRequired;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
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
        // Multiline text field
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.formFieldBGColor,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.formFieldStrokeColor),
          ),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppStyles.textStyle14W400Black.copyWith(
                color: AppColors.formFieldHintColor,
              ),
              border: InputBorder.none,
            ),
            style: AppStyles.textStyle14W400Black,
          ),
        ),
      ],
    );
  }
}

