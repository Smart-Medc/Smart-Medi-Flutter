import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/helpers/validator.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';
import 'package:smart_medi/core/widgets/custom_text_form_field.dart';
import 'package:smart_medi/features/auth/presentation/view/widgets/auth_field_title.dart';
class ForgetPasswordField extends StatefulWidget {
  const ForgetPasswordField({super.key});

  @override
  State<ForgetPasswordField> createState() => _ForgetPasswordFieldState();
}

class _ForgetPasswordFieldState extends State<ForgetPasswordField> {
  final TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        authFieldTitle('Email'),
        CustomTextFormField(hintText: 'example@gmail.com', controller: _emailController,validator: Validator.emailValidator,),
        42.verticalSpace,
        const CustomButton(text: 'Send Code'),
      ],
    );
  }
}
