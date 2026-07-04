import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/app_bar_back_button.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/edit_record_widgets/edit_record_action_buttons.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/edit_record_widgets/edit_record_basic_information.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/upload_new_document.dart';

class EditRecordBody extends StatelessWidget {
  const EditRecordBody({super.key});

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
            const AppHeader(
              title: 'Edit Medical Record',
              subtitle: 'Update your medical record information',
            ),
            24.verticalSpace,
            const EditRecordBasicInformation(),
            16.verticalSpace,
            const SizedBox(width: double.infinity,child: UploadNewDocument()),
            40.verticalSpace,
            const EditRecordActionButtons(),
            60.verticalSpace,
          ],
        ),
      ),
    );
  }
}

