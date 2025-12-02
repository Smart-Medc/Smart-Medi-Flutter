import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/helpers/validator.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';
import 'package:smart_medi/core/widgets/custom_text_form_field.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_field_title.dart';
class ResetPasswordFields extends StatefulWidget {
  const ResetPasswordFields({super.key});

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
          const CustomButton(text: 'Reset'),
        ],
      ),
    );
  }
}
