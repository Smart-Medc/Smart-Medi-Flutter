import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
import 'package:smart_medi/features/home/presentation/views/widgets/home_search_bar.dart';
import 'package:smart_medi/features/meidcal_records/presentation/views/widgets/medical_records_view_widgets/medical_records_document.dart';
import 'package:smart_medi/features/meidcal_records/presentation/views/widgets/medical_records_view_widgets/medical_records_summary.dart';
import 'package:smart_medi/features/meidcal_records/presentation/views/widgets/medical_records_view_widgets/medical_records_upload_new_document.dart';
class MedicalRecordsBody extends StatelessWidget {
  const MedicalRecordsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(top: 68.h, left: 25.w, right: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            32.verticalSpace,
            const AppHeader(title: 'Medical Records', subtitle: 'Securely store and manage your health documents'),
            const HomeSearchBar(),
            const MedicalRecordsSummary(),
            28.verticalSpace,
            Text('Records',style: AppStyles.textStyle24W600Black,),
            14.verticalSpace,
            const MedicalRecordsDocument(documentName: 'Chest X-Ray', date: 'Mar 10, 2024', size: 8.1),
            16.verticalSpace,
            const MedicalRecordsDocument(documentName: 'Chest X-Ray', date: 'Mar 10, 2024', size: 8.1),
            16.verticalSpace,
            const MedicalRecordsUploadNewDocument(),
            100.verticalSpace,
          ],
        ),
      ),
    );
  }
}
