import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/data_sharing/data/models/get_shared_records_models/get_shared_records_response.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/code_generated_view_widgets/code_generated_body.dart';

class CodeGeneratedView extends StatelessWidget {
  const CodeGeneratedView({super.key, required this.sharedRecord});

  final SharedRecordModel sharedRecord;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: CodeGeneratedBody(sharedRecord: sharedRecord),
      ),
    );
  }
}
