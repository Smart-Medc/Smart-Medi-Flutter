import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';
import 'package:smart_medi/features/appointment/presentation/manager/book_appointment_cubit/book_appointment_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/manager/get_availability_days_cubit/get_availability_days_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/book_appointment_body.dart';

class BookAppointmentsView extends StatelessWidget {
  const BookAppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetAvailabilityDaysCubit(getIt<AppointmentRepo>()),
            ),
            BlocProvider(
              create: (context) => BookAppointmentCubit(),
            ),
          ],
          child: const BookAppointmentBody(),
        ),
      ),
    );
  }
}
