import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/validator.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';
import 'package:smart_medi/core/widgets/custom_text_form_field.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_field_title.dart';

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
          Row(
            children: [
              4.horizontalSpace,
              SizedBox(
                height: 15.h,
                width: 15.h,
                child: Checkbox(
                  value: _isAgreeWithTerms,
                  onChanged: (newValue) {
                    _isAgreeWithTerms = newValue ?? false;
                    setState(() {});
                  },
                  activeColor: Colors.black,
                ),
              ),
              10.horizontalSpace,
              Text(
                'Agree with term & conditions',
                style: AppStyles.textStyle14W400Black,
              ),
            ],
          ),
          20.verticalSpace,
          CustomButton(
            text: 'Sign up',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                GoRouter.of(context).pushReplacement(AppRoutes.otpVerificationView,extra: {
                  'isComingFromSignUp' : true,
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
