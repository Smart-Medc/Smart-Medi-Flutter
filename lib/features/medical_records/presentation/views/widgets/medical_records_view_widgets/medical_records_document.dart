import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/icon_with_background.dart';
import 'package:smart_medi/core/widgets/item_action_menu.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/medical_records_share_download_button.dart';

class MedicalRecordsDocument extends StatelessWidget {
  const MedicalRecordsDocument({
    super.key,
    required this.documentName,
    required this.date,
    required this.size,
    required this.recordId,
    required this.patientId,
  });

  final String documentName;
  final String recordId;
  final String date;
  final double size;
  final String patientId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        GoRouter.of(context).push(AppRoutes.recordDetailsView,extra: {
          'recordId': recordId,
          'patientId': patientId,
        });
      },
      child: CardContainer(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 20.h,
          bottom: 16.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const IconWithBackground(
                  icon: Icons.picture_as_pdf_outlined,
                  backgroundColor: AppColors.iconBGBlue,
                  iconColor: AppColors.iconBlue,
                ),
                10.horizontalSpace,
                Expanded(child: Text(documentName, style: AppStyles.textStyle15W600Black)),
                const Spacer(),
                const ItemActionMenu()
              ],
            ),
            34.verticalSpace,
            Text('Imaging', style: AppStyles.textStyle10W400LightGrey),
            Text('$date - $size GB', style: AppStyles.textStyle10W400LightGrey),
            10.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: MedicalRecordsShareDownloadButton(
                    text: 'Share',
                    icon: Icons.share_outlined,
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.editRecordView);
                    },
                    backgroundColor: AppColors.greyBackgroundColor,
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: MedicalRecordsShareDownloadButton(
                    text: 'Download',
                    icon: Icons.download_outlined,
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.editRecordView);
                    },
                    backgroundColor: AppColors.greyBackgroundColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
