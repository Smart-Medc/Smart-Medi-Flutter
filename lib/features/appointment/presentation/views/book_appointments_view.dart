import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/features/appointment/data/models/get_availability_days/get_availability_days_request.dart';
import 'package:smart_medi/features/appointment/data/models/get_organizations_models/get_organizations_response.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';
import 'package:smart_medi/features/appointment/presentation/manager/book_appointment_cubit/book_appointment_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/manager/get_availability_days_cubit/get_availability_days_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/book_appointment_body.dart';

class BookAppointmentsView extends StatelessWidget {
  const BookAppointmentsView({super.key, required this.organization});
  final GetOrganizationsResponse organization;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetAvailabilityDaysCubit(getIt<AppointmentRepo>())..getAvailabilityDays(request: GetAvailabilityDaysRequest(organizationId: organization.id, month: DateTime.now())),
            ),
            BlocProvider(
              create: (context) => BookAppointmentCubit(),
            ),
          ],
          child: BookAppointmentBody(organization: organization,),
        ),
      ),
    );
  }
}
