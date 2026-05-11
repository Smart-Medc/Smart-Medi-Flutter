import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';

class MedicationManagementHeader extends StatelessWidget {
  const MedicationManagementHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: AppHeader(
            title: 'Medication Management',
            subtitle: 'Track your medications and set reminders',
          ),
        ),
        12.horizontalSpace,
        CustomButton(
          text: 'Add Medication',
          width: 100,
          height: 36,
          textStyle: AppStyles.textStyle12W500White,
          onPressed: () => context.push(AppRoutes.addMedication),
        ),
      ],
    );
  }
}
