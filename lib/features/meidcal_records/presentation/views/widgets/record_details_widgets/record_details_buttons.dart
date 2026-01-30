import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/meidcal_records/presentation/views/widgets/medical_records_share_download_button.dart';

class RecordDetailsButtons extends StatelessWidget {
  const RecordDetailsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MedicalRecordsShareDownloadButton(
            icon: Icons.share,
            text: 'Share',
            backgroundColor: AppColors.greyBackgroundColor,
            onTap: () {
              GoRouter.of(context).push(AppRoutes.editRecordView);
            },
          ),
        ),
        12.horizontalSpace,
        Expanded(
          child: MedicalRecordsShareDownloadButton(
            icon: Icons.download,
            text: 'Download',
            backgroundColor: AppColors.primaryColor,
            onTap: () {
              GoRouter.of(context).push(AppRoutes.editRecordView);
            },
            style: AppStyles.textStyle12W500White,
            iconColor: AppColors.textWhite,
          ),
        ),
      ],
    );
  }
}
