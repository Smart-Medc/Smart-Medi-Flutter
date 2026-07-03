import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/features/appointment/data/models/get_organizations_models/get_organizations_response.dart';
import 'package:smart_medi/features/appointment/presentation/manager/book_appointment_cubit/book_appointment_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/booking_header_section.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/continue_button_widget.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/date_time_selection_section.dart';

class BookAppointmentBody extends StatelessWidget {
  const BookAppointmentBody({super.key, required this.organization});
  final GetOrganizationsResponse organization;
  void _showConfirmationSnackBar(BuildContext context, DateTime date, String time) {
    context.showSnackBar(
      Text(
        'Appointment booked for $time on ${date.day}/${date.month}/${date.year}',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<BookAppointmentCubit, BookAppointmentState>(
          listenWhen: (_, current) => current.isConfirmed,
          listener: (context, state) {
            _showConfirmationSnackBar(
              context,
              state.selectedDate,
              state.selectedTime!,
            );
          },
        ),
      ],
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 16.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BookingHeaderSection(
                    organization: organization,
                  ),
                  16.verticalSpace,
                  DateTimeSelectionSection(organizationId: organization.id),
                  24.verticalSpace,
                ],
              ),
            ),
          ),
          _ContinueButtonSection(organization: organization),
        ],
      ),
    );
  }
}

class _ContinueButtonSection extends StatelessWidget {
  const _ContinueButtonSection({required this.organization});
  final GetOrganizationsResponse organization;

  @override
  Widget build(BuildContext context) {
    final selectedTime = context.select(
      (BookAppointmentCubit cubit) => cubit.state.selectedTime,
    );

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: ContinueButtonWidget(
        selectedTime: selectedTime,
        onPressed: selectedTime == null
            ? null
            : () {
                final state = context.read<BookAppointmentCubit>().state;
                context.push(
                  AppRoutes.completeBookingView,
                  extra: {
                    'date': state.selectedDate,
                    'time': state.selectedTime,
                    'organization': organization,
                  },
                );
              },
      ),
    );
  }
}
