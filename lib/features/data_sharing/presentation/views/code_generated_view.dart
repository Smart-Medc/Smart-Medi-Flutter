import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/code_generated_view_widgets/code_generated_body.dart';
class CodeGeneratedView extends StatelessWidget {
  const CodeGeneratedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: CodeGeneratedBody(),
      ),
    );
  }
}
