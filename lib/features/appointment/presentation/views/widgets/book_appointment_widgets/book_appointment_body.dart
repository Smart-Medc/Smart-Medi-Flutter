import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/features/appointment/presentation/manager/book_appointment_cubit/book_appointment_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/booking_header_section.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/continue_button_widget.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/date_time_selection_section.dart';

class BookAppointmentBody extends StatelessWidget {
  const BookAppointmentBody({super.key});

  void _showConfirmationSnackBar(BuildContext context, DateTime date, String time) {
    context.showSnackBar(
      Text(
        'Appointment booked for $time on ${date.day}/${date.month}/${date.year}',
      ),
    );
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(
    //       'Appointment booked for $time on ${date.day}/${date.month}/${date.year}',
    //     ),
    //     behavior: SnackBarBehavior.floating,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //     margin: const EdgeInsets.all(16),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookAppointmentCubit, BookAppointmentState>(
      listenWhen: (_, current) => current.isConfirmed,
      listener: (context, state) {
        _showConfirmationSnackBar(context, state.selectedDate, state.selectedTime!);
      },
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 16.h,
              ),
              child: BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BookingHeaderSection(),
                      16.verticalSpace,
                      DateTimeSelectionSection(
                        selectedDate: state.selectedDate,
                        selectedTime: state.selectedTime,
                        onDateSelected: (date) =>
                            context.read<BookAppointmentCubit>().selectDate(date),
                        onTimeSelected: (time) =>
                            context.read<BookAppointmentCubit>().selectTime(time),
                      ),
                      24.verticalSpace,
                    ],
                  );
                },
              ),
            ),
          ),
          BlocBuilder<BookAppointmentCubit, BookAppointmentState>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: ContinueButtonWidget(
                  selectedTime: state.selectedTime,
                  onPressed: () =>
                      context.read<BookAppointmentCubit>().confirmBooking(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
