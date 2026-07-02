import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/appointment_header_widget.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/hospital_card_widget.dart';

class BookingHeaderSection extends StatelessWidget {
  const BookingHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppointmentHeaderWidget(),
        20.verticalSpace,
        const HospitalCardWidget(
          hospitalName: 'City Medical Center',
          hospitalTag: 'Hospital',
          hospitalAddress: '123 Medical Plaza, Downtown',
        ),
      ],
    );
  }
}
