import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/icon_with_background.dart';
import 'package:smart_medi/core/widgets/item_action_menu.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_delete_helper.dart';

class CurrentMedication extends StatelessWidget {

  const CurrentMedication({
    super.key,
    required this.medicationId,
    required this.medicationName,
    required this.dosage,
    required this.frequency,
    required this.type,
    required this.startDate,
    required this.doctorName,
    required this.adherence,
    this.hasInteraction = false,
  });
  final String medicationId;
  final String medicationName;
  final String dosage;
  final String frequency;
  final String type;
  final String startDate;
  final String doctorName;
  final int adherence;
  final bool hasInteraction;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const IconWithBackground(
                icon: Icons.medication,
                backgroundColor: AppColors.iconBGBlue,
                iconColor: AppColors.iconBlue,
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          medicationName,
                          style: AppStyles.textStyle15W600Black,
                        ),
                        8.horizontalSpace,
                        if (hasInteraction) ...[
                          12.verticalSpace,
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: AppColors.iconRed,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  size: 14.w,
                                  color: AppColors.textWhite,
                                ),
                                4.horizontalSpace,
                                Text(
                                  'Interaction',
                                  style: AppStyles.textStyle12W600Black.copyWith(
                                    color: AppColors.textWhite,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        const Spacer(),
                        ItemActionMenu(
                          onEdit: () {
                            GoRouter.of(context).push(AppRoutes.editMedication);
                          },
                          onDelete: () => confirmAndDeleteMedication(
                            context: context,
                            medicationId: medicationId,
                            medicationName: medicationName,
                          ),
                        ),
                      ],
                    ),
                    6.verticalSpace,
                    Text(
                      '$dosage • $frequency • $type',
                      style: AppStyles.textStyle10W400LightGrey,
                    ),
                  ],
                ),
              ),
            ],
          ),
          12.verticalSpace,
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                size: 14.w,
                color: AppColors.textBlack,
              ),
              4.horizontalSpace,
              Text(
                'Started: $startDate   •   Dr. $doctorName',
                style: AppStyles.textStyle11W500Black,
              ),
            ],
          ),
          12.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Adherence',
                          style: AppStyles.textStyle10W400LightGrey,
                        ),
                        const Spacer(),
                        Text(
                          '$adherence%',
                          style: AppStyles.textStyle12W600Black,
                        ),
                      ],
                    ),
                    2.verticalSpace,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
                      child: LinearProgressIndicator(
                        value: adherence / 100,
                        backgroundColor: AppColors.formFieldBGColor,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          adherence >= 85 ? AppColors.iconBlue : adherence >= 70 ? AppColors.iconYellow : AppColors.iconRed,
                        ),
                        minHeight: 6.h,
                      ),
                    ),
                  ],
                ),
              ),
              12.horizontalSpace,
              InkWell(
                onTap: () {
                  // Set reminder action
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: AppColors.formFieldBGColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.schedule,
                        size: 16.w,
                        color: AppColors.textBlack,
                      ),
                      8.horizontalSpace,
                      Text(
                        'Set Reminder',
                        style: AppStyles.textStyle12W600Black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

