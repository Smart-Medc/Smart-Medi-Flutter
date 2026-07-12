import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/validator.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';
import 'package:smart_medi/core/widgets/custom_text_form_field.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_field_title.dart';

class OrganizationBasicInfoStep extends StatelessWidget {
  const OrganizationBasicInfoStep({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.phoneNumberController,
    required this.organizationNameController,
    required this.organizationTypeController,
    required this.firstNameController,
    required this.lastNameController,
    required this.onNext,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController passwordController;
  final TextEditingController phoneNumberController;
  final TextEditingController organizationNameController;
  final TextEditingController organizationTypeController;
  final VoidCallback onNext;

  String? _requiredValidator(String? value, String label) {
    if (value == null || value.trim().isEmpty) return '$label is required';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    authFieldTitle('First Name'),
                    CustomTextFormField(
                      controller: firstNameController,
                      hintText: 'First Name',
                      validator: (value) => _requiredValidator(value, 'First Name'),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    authFieldTitle('Last Name'),
                    CustomTextFormField(
                      controller: lastNameController,
                      hintText: 'Last Name',
                      validator: (value) => _requiredValidator(value, 'Last Name'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          16.verticalSpace,
          authFieldTitle('Email'),
          4.verticalSpace,
          CustomTextFormField(
            hintText: 'example@gmail.com',
            controller: emailController,
            validator: Validator.emailValidator,
          ),
          16.verticalSpace,
          authFieldTitle('Password'),
          4.verticalSpace,
          CustomTextFormField.password(
            hintText: 'Password',
            controller: passwordController,
            validator: Validator.passwordValidator,
          ),
          16.verticalSpace,
          authFieldTitle('Phone'),
          4.verticalSpace,
          CustomTextFormField(
            hintText: '012 100 023 3413',
            controller: phoneNumberController,
            validator: Validator.phoneNumberValidator,
          ),
          16.verticalSpace,
          authFieldTitle('Organization Name'),
          4.verticalSpace,
          CustomTextFormField(
            hintText: 'Organization Name',
            controller: organizationNameController,
            validator: (v) => _requiredValidator(v, 'Organization name'),
          ),
          16.verticalSpace,
          authFieldTitle('Organization Type'),
          4.verticalSpace,
          CustomTextFormField.dropdown(
            dropdownItems: const ['Hospital', 'Clinic', 'IndividualDoctor'],
            hintText: 'Ex. Hospital, Clinic or Doctor',
            controller: organizationTypeController,
            validator: (v) => _requiredValidator(v, 'Organization type'),
          ),
          20.verticalSpace,
          CustomButton(text: 'Next', onPressed: onNext),
          20.verticalSpace,
          Row(
            children: [
              Expanded(child: Divider(thickness: 1.sp, color: Colors.black)),
              10.horizontalSpace,
              Text('or', style: AppStyles.textStyle20W400Black),
              10.horizontalSpace,
              Expanded(child: Divider(thickness: 1.sp, color: Colors.black)),
            ],
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account? ", style: AppStyles.textStyle14W400Black),
              InkWell(
                onTap: () => GoRouter.of(context).replace(AppRoutes.loginView),
                child: Text('Sign in', style: AppStyles.textStyle18W700Black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
