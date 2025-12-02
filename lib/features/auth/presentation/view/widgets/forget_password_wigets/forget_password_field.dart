import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/validator.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
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
          CustomTextFormField(hintText: 'example@gmail.com', controller: _emailController,validator: Validator.emailValidator,),
          42.verticalSpace,
          CustomButton(text: 'Send Code',onPressed: (){
            if(_formKey.currentState!.validate()){
              GoRouter.of(context).push(AppRoutes.otpVerificationView,extra: {
                'isComingFromSignUp': false,
              });
            }
          },),
        ],
      ),
    );
  }
}
