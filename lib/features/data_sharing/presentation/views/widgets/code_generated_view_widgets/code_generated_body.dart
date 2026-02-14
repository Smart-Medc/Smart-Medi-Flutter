import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/app_bar_back_button.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
class CodeGeneratedBody extends StatelessWidget {
  const CodeGeneratedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarBackButton(),
            AppHeader(title: 'Share Medical Records', subtitle: 'Select records to share and configure access settings'),

          ],
        ),
      ),
    );
  }
}
