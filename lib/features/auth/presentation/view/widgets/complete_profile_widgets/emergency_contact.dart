import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/helpers/validator.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/custom_text_form_field.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_field_title.dart';

class EmergencyContact extends StatelessWidget {
  const EmergencyContact({
    super.key,
    required this.contactNameController,
    required this.contactNumberController,
    required this.relationshipController,
  });

  final TextEditingController contactNameController;
  final TextEditingController contactNumberController;
  final TextEditingController relationshipController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Emergency Contact',
          style: AppStyles.textStyle22W500Black,
        ),
        16.verticalSpace,
        authFieldTitle('Contact Name'),
        4.verticalSpace,
        CustomTextFormField(
          hintText: 'Enter contact name',
          validator: Validator.userNameValidator,
          controller: contactNameController,
        ),
        16.verticalSpace,
        authFieldTitle('Contact Number'),
        4.verticalSpace,
        CustomTextFormField(
          hintText: 'Enter contact number',
          validator: Validator.phoneNumberValidator,
          controller: contactNumberController,
        ),
        16.verticalSpace,
        authFieldTitle('Relationship'),
        4.verticalSpace,
        CustomTextFormField.dropdown(
          hintText: 'Select relationship',
          controller: relationshipController,
          validator: (value) => Validator.requiredValidator(value, 'Please select the relationship'),
          dropdownItems: const [
            'Parent',
            'Spouse',
            'Sibling',
            'Child',
            'Friend',
            'Other',
          ],
        ),
      ],
    );
  }
}
