import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/appointment/data/models/get_availability_days/get_availability_days_response.dart';
import 'package:smart_medi/features/appointment/data/models/get_availability_hours_models/get_availability_hours_request.dart';
import 'package:smart_medi/features/appointment/data/models/get_availability_hours_models/get_availability_hours_response.dart';
import 'package:smart_medi/features/appointment/presentation/manager/book_appointment_cubit/book_appointment_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/manager/get_availability_days_cubit/get_availability_days_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/manager/get_availability_hours_cubit/get_availability_hours_cubit.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/date_selector_widget.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/time_slots_widget.dart';

class DateTimeSelectionSection extends StatelessWidget {
  final String organizationId;

  const DateTimeSelectionSection({
    super.key,
    required this.organizationId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _DateSelectorSection(organizationId: organizationId),
        const SizedBox(height: 16),
        const _TimeSlotsSection(),
      ],
    );
  }
}

class _DateSelectorSection extends StatelessWidget {
  final String organizationId;

  const _DateSelectorSection({required this.organizationId});

  @override
  Widget build(BuildContext context) {
    final selectedDate = context.select(
      (BookAppointmentCubit cubit) => cubit.state.selectedDate,
    );

    return BlocBuilder<GetAvailabilityDaysCubit, GetAvailabilityDaysState>(
      builder: (context, state) {
        if (state is GetAvailabilityDaysLoading) {
          return const _LoadingCard(
            height: 340,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final availabilityDays = state is GetAvailabilityDaysSuccess
            ? state.availabilityDays
            : const <GetAvailabilityDaysResponse>[];

        return DateSelectorWidget(
          selectedDate: selectedDate,
          availabilityDays: availabilityDays,
          onDateSelected: (date) {
            final bookCubit = context.read<BookAppointmentCubit>();
            final hoursCubit = context.read<GetAvailabilityHoursCubit>();

            final currentDate = bookCubit.state.selectedDate;

            // 🔥 هنا المهم
            final isSameDay =
                currentDate.year == date.year &&
                    currentDate.month == date.month &&
                    currentDate.day == date.day;

            // ❌ لو نفس اليوم → متعملش أي حاجة
            if (isSameDay) return;

            // ✅ غير اليوم → اعمل update + API call
            bookCubit.selectDate(date);

            hoursCubit.getAvailabilityHours(
              request: GetAvailabilityHoursRequest(
                organizationId: organizationId,
                date: date,
              ),
            );
          },
        );
      },
    );
  }
}

class _TimeSlotsSection extends StatelessWidget {
  const _TimeSlotsSection();

  @override
  Widget build(BuildContext context) {
    final selectedDate = context.select(
      (BookAppointmentCubit cubit) => cubit.state.selectedDate,
    );
    final selectedTime = context.select(
      (BookAppointmentCubit cubit) => cubit.state.selectedTime,
    );

    return BlocBuilder<GetAvailabilityHoursCubit, GetAvailabilityHoursState>(
      builder: (context, state) {
        if (state is GetAvailabilityHoursLoading) {
          return const _LoadingCard(
            height: 220,
            child: _TimeSlotsSkeleton(),
          );
        }

        final availabilityHours = state is GetAvailabilityHoursSuccess
            ? state.availabilityHours
            : const <GetAvailabilityHoursResponse>[];

        return TimeSlotsWidget(
          selectedDate: selectedDate,
          selectedTime: selectedTime,
          availabilityHours: availabilityHours,
          onTimeSelected: (time) =>
              context.read<BookAppointmentCubit>().selectTime(time),
        );
      },
    );
  }
}

class _LoadingCard extends StatelessWidget {
  final double height;
  final Widget child;

  const _LoadingCard({
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: child,
      ),
    );
  }
}

class _TimeSlotsSkeleton extends StatelessWidget {
  const _TimeSlotsSkeleton();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 12,
          width: 120,
          decoration: BoxDecoration(
            color: AppColors.grey.withValues(alpha: 0.18),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(height: 18),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.grey.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
