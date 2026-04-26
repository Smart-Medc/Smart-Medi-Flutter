import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';

class AppointmentHeaderWidget extends StatelessWidget {
  const AppointmentHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).maybePop(),
          child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.textBlack,
              size: 24,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Book Appointment',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppColors.textBlack,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Select date and time',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textDarkGrey,
          ),
        ),
      ],
    );
  }
}
