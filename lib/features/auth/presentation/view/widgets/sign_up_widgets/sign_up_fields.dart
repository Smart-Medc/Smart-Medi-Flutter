import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/helpers/validator.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';
import 'package:smart_medi/core/widgets/custom_text_form_field.dart';
import 'package:smart_medi/features/auth/data/models/sign_up/sign_up_request_model.dart';
import 'package:smart_medi/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_field_title.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/sign_up_widgets/terms_conditions_checkbox.dart';

class SignUpFields extends StatefulWidget {
  const SignUpFields({super.key});

  @override
  State<SignUpFields> createState() => _SignUpFieldsState();
}

class _SignUpFieldsState extends State<SignUpFields> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _isAgreeWithTerms = false;
  String? _termsErrorText;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    phoneNumberController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          authFieldTitle('Username'),
          4.verticalSpace,
          CustomTextFormField(
            hintText: 'Ex. Mo ra',
            controller: userNameController,
            validator: Validator.userNameValidator,
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
          authFieldTitle('Phone'),
          4.verticalSpace,
          CustomTextFormField(
            hintText: '012 100 023 3413',
            controller: phoneNumberController,
            validator: Validator.phoneNumberValidator,
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
          authFieldTitle('Confirm Password'),
          4.verticalSpace,
          CustomTextFormField.password(
            hintText: 'Confirm Password',
            controller: confirmPasswordController,
            validator: (value) {
              return Validator.passwordConfirmValidator(
                value,
                passwordController.text.trim(),
              );
            },
          ),

          12.verticalSpace,
          TermsConditionsCheckbox(
            value: _isAgreeWithTerms,
            onChanged: (value) {
              setState(() {
                _isAgreeWithTerms = value;
                if (value) {
                  _termsErrorText = null;
                }
              });
            },
            errorText: _termsErrorText,
          ),
          20.verticalSpace,
          CustomButton(
            text: 'Sign up',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (!_isAgreeWithTerms) {
                  setState(() {
                    _termsErrorText = 'You must agree to the terms & conditions';
                  });
                  return;
                }

                final email = emailController.text.trim();
                context.read<SignUpCubit>().signUp(
                  signUpRequestModel: SignUpRequestModel(
                    firstName: userNameController.text.trim(),
                    lastName: '--',
                    email: email,
                    phoneNumber: phoneNumberController.text.trim(),
                    password: passwordController.text.trim(),
                    confirmPassword: confirmPasswordController.text.trim(),
                    dateOfBirth: '2026-02-16T16:00:42.826Z',
                    gender: 'Male',
                    emergencyContactName: 'emergencyContactName',
                    emergencyContactPhone: '12345623456',
                    emergencyContactRelationship:
                        'Spouse',
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
