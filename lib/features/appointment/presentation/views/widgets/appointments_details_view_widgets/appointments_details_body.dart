import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_actions_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_header.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_information.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_medical_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_policy_cancellation.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_reminder_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_shared_Record.dart';
class AppointmentsDetailsBody extends StatelessWidget {
  const AppointmentsDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppointmentsDetailsHeader(),
          16.verticalSpace,
          const AppointmentsDetailsMedicalCard(),
          12.verticalSpace,
          const AppointmentsDetailsInformation(),
          12.verticalSpace,
          const AppointmentsDetailsSharedRecord(),
          12.verticalSpace,
          const AppointmentsDetailsActionsCard(),
          12.verticalSpace,
          const AppointmentsDetailsReminderCard(),
          12.verticalSpace,
          const AppointmentsDetailsPolicyCancellation(),
          24.verticalSpace,
        ],
      ),
    );
  }
}
