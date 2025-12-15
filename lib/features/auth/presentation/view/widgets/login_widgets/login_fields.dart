import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/validator.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';
import 'package:smart_medi/core/widgets/custom_text_form_field.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_field_title.dart';

class LoginFields extends StatefulWidget {
  const LoginFields({super.key});

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          12.verticalSpace,
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: (){
                GoRouter.of(context).push(AppRoutes.forgetPasswordView);
              },
              child: Text(
                'Forget Password?',
                style: AppStyles.textStyle16W400Black,
              ),
            ),
          ),
          48.verticalSpace,
          CustomButton(
            text: 'Login',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                GoRouter.of(context).push(AppRoutes.homeView);
              }
            },
          ),
        ],
      ),
    );
  }
}
