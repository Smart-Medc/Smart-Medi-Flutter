import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/features/appointment/data/models/post_appointment_models/post_appointment_request.dart';
import 'package:smart_medi/features/appointment/presentation/manager/post_appointment_cubit/post_appointment_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/complete_booking_widgets/confirm_booking_button.dart';

class PostAppointmentBlocConsumer extends StatelessWidget {
  const PostAppointmentBlocConsumer({
    super.key,
    required this.isFormValid,
    required this.postAppointmentRequest,
  });

  final bool isFormValid;
  final PostAppointmentRequest postAppointmentRequest;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostAppointmentCubit, PostAppointmentState>(
      listener: (context, state) {
        if (state is PostAppointmentSuccess) {
          GoRouter.of(context).push(
            AppRoutes.appointmentsConfirmedView,
          );
        }

        if (state is PostAppointmentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return ConfirmBookingButton(
          isEnabled: isFormValid,
          isLoading: state is PostAppointmentLoading,
          onPressed: () {
            context.read<PostAppointmentCubit>()
                .postAppointment(postAppointmentRequest: postAppointmentRequest);
          },
        );
      },
    );
  }
}