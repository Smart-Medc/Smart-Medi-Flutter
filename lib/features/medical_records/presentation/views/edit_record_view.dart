import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/edit_record_widgets/edit_record_body.dart';

class EditRecordView extends StatelessWidget {
  const EditRecordView({super.key, required this.isEdit, this.recordId});
  final bool isEdit;
  final String? recordId;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: EditRecordBody(isEdit: isEdit,),
      ),
    );
  }
}

