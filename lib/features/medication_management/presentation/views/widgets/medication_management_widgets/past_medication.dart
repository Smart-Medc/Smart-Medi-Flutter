import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/icon_with_background.dart';

class PastMedication extends StatelessWidget {

  const PastMedication({
    super.key,
    required this.medicationName,
    required this.dosage,
    required this.frequency,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.doctorName,
  });
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
                        Icon(
                          Icons.more_vert,
                          size: 20.w,
                          color: AppColors.textBlack,
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

