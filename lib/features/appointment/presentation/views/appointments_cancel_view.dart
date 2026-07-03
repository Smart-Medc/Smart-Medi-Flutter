import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';
import 'package:smart_medi/features/appointment/presentation/manager/cancel_appointment_cubit/cancel_appointment_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_cancel_widgets/appointments_cancel_appointment_card.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_cancel_widgets/appointments_cancel_header.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_cancel_widgets/reason_for_cancellation_and_policy.dart';

class AppointmentsCancelView extends StatefulWidget {
  const AppointmentsCancelView({super.key});

  @override
  State<AppointmentsCancelView> createState() => _AppointmentsCancelViewState();
}

class _AppointmentsCancelViewState extends State<AppointmentsCancelView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => CancelAppointmentCubit(getIt<AppointmentRepo>()),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppointmentsCancelHeader(),
                const SizedBox(height: 16),
                const AppointmentsCancelAppointmentCard(),
                const SizedBox(height: 16),
                ReasonForCancellationAndPolicy(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

