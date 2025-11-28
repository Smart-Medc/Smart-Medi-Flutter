import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/custom_text_form_field.dart';
class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(hintText: 'Normal', controller: TextEditingController()),
        40.verticalSpace,
        CustomTextFormField.password(hintText: 'password', controller: TextEditingController()),
        40.verticalSpace,
        CustomTextFormField.date(hintText: 'date', controller: TextEditingController(),),
        40.verticalSpace,
        CustomTextFormField.dropdown(hintText: 'dropdown', controller: TextEditingController(),dropdownItems: const ['text1,text2,text3','text2'],),
        40.verticalSpace,
      ],
    );
  }
}
