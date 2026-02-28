import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class TermsConditionsCheckbox extends StatelessWidget {
  const TermsConditionsCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.errorText,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => onChanged(!value),
          child: Row(
            children: [
              4.horizontalSpace,
              SizedBox(
                height: 15.h,
                width: 15.h,
                child: Checkbox(
                  value: value,
                  onChanged: (newValue) => onChanged(newValue ?? false),
                  activeColor: Colors.black,
                  isError: errorText != null,
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: Text(
                  'Agree with terms & conditions',
                  style: AppStyles.textStyle14W400Black,
                ),
              ),
            ],
          ),
        ),
        if (errorText != null) ...[
          8.verticalSpace,
          Padding(
            padding: EdgeInsets.only(left: 29.w),
            child: Text(
              errorText!,
              style: TextStyle(
                color: Colors.red,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

