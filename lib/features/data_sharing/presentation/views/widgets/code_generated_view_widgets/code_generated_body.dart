import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/app_bar_back_button.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/code_generated_view_widgets/box_code_and_copy_buttons.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/code_generated_view_widgets/code_generated_successfully.dart';
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
            const AppBarBackButton(),
            const AppHeader(title: 'Share Medical Records', subtitle: 'Select records to share and configure access settings'),
            20.verticalSpace,
            const CodeGeneratedSuccessfully(),
            32.verticalSpace,
            const BoxCodeAndCopyButtons()
          ],
        ),
      ),
    );
  }
}
