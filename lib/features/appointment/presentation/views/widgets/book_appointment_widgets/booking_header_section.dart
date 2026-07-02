import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/appointment/data/models/get_organizations_models/get_organizations_response.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/appointment_header_widget.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/book_appointment_widgets/hospital_card_widget.dart';

class BookingHeaderSection extends StatelessWidget {
  const BookingHeaderSection({super.key,required this.organization});
  final GetOrganizationsResponse organization;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppointmentHeaderWidget(),
        20.verticalSpace,
        HospitalCardWidget(
          hospitalName: organization.name,
          hospitalTag: organization.type,
          hospitalAddress: organization.address,
        ),
      ],
    );
  }
}
