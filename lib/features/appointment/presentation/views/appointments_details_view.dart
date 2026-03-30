import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_actions_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_header.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_information.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_medical_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_policy_cancellation.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_reminder_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/appointments_details_shared_Record.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/shared_reusable_widgets.dart';

class AppointmentsDetailsView extends StatelessWidget {
  const AppointmentsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FA),
        elevation: 0,
        leading: const BackButton(color: Colors.black87),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppointmentsDetailsHeader(),
            SizedBox(height: 16),
            AppointmentsDetailsMedicalCard(),
            SizedBox(height: 12),
            AppointmentsDetailsInformation(),
            SizedBox(height: 12),
            AppointmentsDetailsSharedRecord(),
            SizedBox(height: 12),
            AppointmentsDetailsActionsCard(),
            SizedBox(height: 12),
            AppointmentsDetailsReminderCard(),
            SizedBox(height: 12),
            AppointmentsDetailsPolicyCancellation(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
