import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';
import 'package:smart_medi/core/widgets/custom_text_form_field.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_field_title.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/sign_up_widgets/terms_conditions_checkbox.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/views/widgets/organization_step_back_button.dart';

class OrganizationDetailsStep extends StatelessWidget {
  const OrganizationDetailsStep({
    super.key,
    required this.formKey,
    required this.descriptionController,
    required this.ssnController,
    required this.addressController,
    required this.websiteController,
    required this.isAgreeWithTerms,
    required this.termsErrorText,
    required this.onTermsChanged,
    required this.onNext,
    required this.onBack,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController descriptionController;
  final TextEditingController ssnController;
  final TextEditingController addressController;
  final TextEditingController websiteController;
  final bool isAgreeWithTerms;
  final String? termsErrorText;
  final ValueChanged<bool> onTermsChanged;
  final VoidCallback onNext;
  final VoidCallback onBack;

  String? _requiredValidator(String? value, String label) {
    if (value == null || value.trim().isEmpty) return '$label is required';
    return null;
  }

  Widget _requiredFieldTitle(String label) {
    return RichText(
      text: TextSpan(
        text: label,
        style: AppStyles.textStyle14W400Black,
        children: [
          TextSpan(
            text: ' *',
            style: AppStyles.textStyle14W400Black.copyWith(color: Colors.red),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrganizationStepBackButton(onTap: onBack),
          _requiredFieldTitle('Description'),
          4.verticalSpace,
          CustomTextFormField(
            hintText: 'Describe your organization',
            controller: descriptionController,
          ),
          16.verticalSpace,
          _requiredFieldTitle('Physical Address'),
          4.verticalSpace,
          CustomTextFormField(
            hintText: 'Physical Address',
            controller: addressController,
            validator: (v) => _requiredValidator(v, 'Address'),
          ),
          16.verticalSpace,
          authFieldTitle('Social Security Number (SSN)'),
          4.verticalSpace,
          CustomTextFormField(
            hintText: 'License Number',
            controller: ssnController,
          ),
          16.verticalSpace,
          authFieldTitle('Website'),
          4.verticalSpace,
          CustomTextFormField(
            hintText: 'hospital@example.com',
            controller: websiteController,
          ),
          12.verticalSpace,
          TermsConditionsCheckbox(
            value: isAgreeWithTerms,
            onChanged: onTermsChanged,
            errorText: termsErrorText,
          ),
          20.verticalSpace,
          CustomButton(text: 'Next', onPressed: onNext),
        ],
      ),
    );
  }
}
