import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/app_bar_back_button.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/edit_record_widgets/add_medical_record_bloc_listener.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/edit_record_widgets/edit_record_content.dart';

class EditRecordBody extends StatelessWidget {
  const EditRecordBody({super.key, required this.isEdit});
  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarBackButton(),
            AppHeader(
              title: isEdit ? 'Edit Medical Record' : 'Create Medical Record',
              subtitle: isEdit ? 'Update your medical record information' : 'Fill in the details for your new medical record',
            ),
            24.verticalSpace,
            if (!isEdit) AddMedicalRecordBlocListener(isEdit: isEdit) else EditRecordContent(isEdit: isEdit),
          ],
        ),
      ),
    );
  }
}

