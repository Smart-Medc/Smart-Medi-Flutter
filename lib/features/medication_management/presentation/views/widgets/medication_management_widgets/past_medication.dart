import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/icon_with_background.dart';
import 'package:smart_medi/core/widgets/item_action_menu.dart';
import 'package:smart_medi/features/medication_management/presentation/manager/get_medications_cubit/get_medications_cubit.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_delete_helper.dart';

class PastMedication extends StatelessWidget {

  const PastMedication({
    super.key,
    required this.medicationId,
    required this.medicationName,
    required this.dosage,
    required this.frequency,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.doctorName,
  });
  final String medicationId;
  final String medicationName;
  final String dosage;
  final String frequency;
  final String type;
  final String startDate;
  final String endDate;
  final String doctorName;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const IconWithBackground(
                icon: Icons.medication,
                backgroundColor: AppColors.iconBGGreen,
                iconColor: Color(0xff848484),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    6.verticalSpace,
                    Row(
                      children: [
                        Text(
                          medicationName,
                          style: AppStyles.textStyle15W600Black,
                        ),
                        const Spacer(),
                        ItemActionMenu(
                          onEdit: () {
                            GoRouter.of(context)
                                .push(
                                  AppRoutes.editMedication,
                                  extra: {
                                    'medicationId': medicationId,
                                    'medicationName': medicationName,
                                    'dosage': dosage,
                                    'frequency': frequency,
                                    'type': type,
                                    'startDate': startDate,
                                    'endDate': endDate,
                                    'doctorName': doctorName,
                                  },
                                )
                                .then((result) {
                                  // Edit screen returns true on success, so we reload only then.
                                  if (result == true && context.mounted) {
                                    context
                                        .read<GetMedicationsCubit>()
                                        .loadMedicationsForCurrentPatient();
                                  }
                                });
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
                    Text('$dosage • $frequency • $type', style: AppStyles.textStyle10W400LightGrey,),
                    6.verticalSpace,
                    Text('$startDate - $endDate . $doctorName',style: AppStyles.textStyle10W400LightGrey,),
                  ],
                ),
              ),
            ],
          ),
          12.verticalSpace,
        ],
      ),
    );
  }
}

