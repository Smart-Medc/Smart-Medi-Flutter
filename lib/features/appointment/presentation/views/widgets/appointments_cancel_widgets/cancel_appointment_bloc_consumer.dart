import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/features/appointment/data/models/cancel_appointment_models/cancel_appointment_request.dart';
import 'package:smart_medi/features/appointment/presentation/manager/cancel_appointment_cubit/cancel_appointment_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_cancel_widgets/confirm_cancellation_button.dart';
class CancelAppointmentBlocConsumer extends StatelessWidget {
  const CancelAppointmentBlocConsumer({
    super.key,
    required this.isEnabled,
    required this.request,
  });

  final bool isEnabled;
  final CancelAppointmentRequest request;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CancelAppointmentCubit, CancelAppointmentState>(
      listener: (context, state) {
        if (state is CancelAppointmentSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Appointment cancelled successfully'),
            ),
          );

          GoRouter.of(context).pushReplacement(AppRoutes.appointmentsView);
        }

        if (state is CancelAppointmentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return ConfirmCancellationButton(
          isEnabled: isEnabled,
          isLoading: state is CancelAppointmentLoading,
          onPressed: () {
            context.read<CancelAppointmentCubit>()
                .cancelAppointment(
              request: request,
            );
          },
        );
      },
    );
  }
}