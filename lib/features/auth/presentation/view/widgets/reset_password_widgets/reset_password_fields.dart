import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/helpers/validator.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';
import 'package:smart_medi/core/widgets/custom_text_form_field.dart';
import 'package:smart_medi/features/auth/data/models/reset_password/reset_password_request.dart';
import 'package:smart_medi/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_field_title.dart';

class ResetPasswordFields extends StatefulWidget {
  const ResetPasswordFields({super.key, required this.email, required this.code});

  final String email;
  final String code;

  @override
  State<ResetPasswordFields> createState() => _ResetPasswordFieldsState();
}

class _ResetPasswordFieldsState extends State<ResetPasswordFields> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          authFieldTitle('New Password'),
          4.verticalSpace,
          CustomTextFormField.password(hintText: 'New Password', controller: _passwordController,validator: Validator.passwordValidator,),
          15.verticalSpace,
          authFieldTitle('Confirm Password'),
          4.verticalSpace,
          CustomTextFormField.password(hintText: 'Confirm Password', controller: _confirmPasswordController,validator: (value) => Validator.passwordConfirmValidator(value, _passwordController.text.trim()),),
          42.verticalSpace,
          CustomButton(
            text: 'Reset',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<ResetPasswordCubit>().resetPassword(
                  resetPasswordRequest: ResetPasswordRequest(
                    email: widget.email,
                    newPassword: _passwordController.text.trim(),
                    confirmPassword: _confirmPasswordController.text.trim(),
                    code: widget.code,
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
