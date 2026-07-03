import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/features/appointment/data/models/get_organizations_models/get_organizations_response.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';
import 'package:smart_medi/features/appointment/presentation/manager/post_appointment_cubit/post_appointment_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/complete_booking_widgets/complete_booking_body.dart';

class CompleteBookingView extends StatelessWidget {
  const CompleteBookingView({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.organization,
  });

  final DateTime selectedDate;
  final String selectedTime;
  final GetOrganizationsResponse organization;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      appBar: _buildAppBar(context),
      body: BlocProvider(
        create: (context) => PostAppointmentCubit(getIt<AppointmentRepo>()),
        child: CompleteBookingBody(
          selectedDate: selectedDate,
          selectedTime: selectedTime,
          organization: organization,
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A2E)),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Book Appointment',
            style: TextStyle(
              color: Color(0xFF1A1A2E),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Complete your booking',
            style: TextStyle(
              color: Color(0xFF888888),
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
