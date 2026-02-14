import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/custom_text_form_field.dart';

class AccessExpirationSection extends StatelessWidget {
  const AccessExpirationSection({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Access Expiration',
          style: AppStyles.textStyle14W400Black,
        ),
        8.verticalSpace,

        CustomTextFormField.dropdown(
          hintText: 'Select expiration time',
          controller: controller,
          dropdownItems: const [
            '1 Hour',
            '6 Hours',
            '24 Hours',
            '7 Days',
            '30 Days',
            'Permanent (No expiration)',
          ],
        ),
      ],
    );
  }
}

