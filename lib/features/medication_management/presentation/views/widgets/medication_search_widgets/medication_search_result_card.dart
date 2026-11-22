import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/icon_with_background.dart';
import 'package:smart_medi/features/medication_management/data/models/get_medications_model/get_medication_response.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_data_utils.dart';

class MedicationSearchResultCard extends StatelessWidget {
  const MedicationSearchResultCard({
    super.key,
    required this.medication,
  });

  final MedicationModel medication;

  @override
  Widget build(BuildContext context) {
    final medicationType = medication.routeName.isNotEmpty
        ? medication.routeName
        : medication.route;
    final isCurrent = isCurrentMedication(medication);
    final isPast = isPastMedication(medication);
    final statusLabel = isCurrent
        ? 'Current'
        : isPast
            ? 'Past'
            : medication.statusName;

    return CardContainer(
      padding: EdgeInsets.all(14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconWithBackground(
                icon: Icons.medication,
                backgroundColor:
                    isCurrent ? AppColors.iconBGBlue : AppColors.iconBGGreen,
                iconColor:
                    isCurrent ? AppColors.iconBlue : AppColors.textDarkGrey,
              ),
              10.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medication.name,
                      style: AppStyles.textStyle15W600Black,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    4.verticalSpace,
                    Text(
                      '${medication.dosage} • ${medication.frequency} • $medicationType',
                      style: AppStyles.textStyle10W400LightGrey,
                    ),
                  ],
                ),
              ),
              8.horizontalSpace,
              _StatusChip(label: statusLabel, isCurrent: isCurrent),
            ],
          ),
          if (medication.hasInteraction) ...[
            10.verticalSpace,
            Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  size: 16.w,
                  color: AppColors.iconRed,
                ),
                6.horizontalSpace,
                Expanded(
                  child: Text(
                    medication.interactionNotes?.trim().isNotEmpty == true
                        ? medication.interactionNotes!
                        : 'Potential interaction detected',
                    style: AppStyles.textStyle10W500DarkGrey,
                  ),
                ),
              ],
            ),
          ],
          10.verticalSpace,
          Text(
            'Started: ${formatMedicationDate(medication.startDate)}',
            style: AppStyles.textStyle11W500Black,
          ),
          4.verticalSpace,
          Text(
            'Prescribed by Dr. ${medication.prescribingDoctor}',
            style: AppStyles.textStyle10W400DarkGrey,
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.label,
    required this.isCurrent,
  });

  final String label;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: isCurrent ? AppColors.iconBGBlue : AppColors.iconBGGreen,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        label,
        style: AppStyles.textStyle10W500DarkGrey,
      ),
    );
  }
}

