import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/appointment/data/models/get_appointment_details_models/get_appointment_details_response.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_details_view_widgets/shared_reusable_widgets.dart';

class AppointmentsDetailsMedicalCard extends StatelessWidget {
  const AppointmentsDetailsMedicalCard({super.key, required this.appointmentDetails});
  final GetAppointmentDetailsResponse appointmentDetails;
  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title row
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.local_hospital_outlined,
                  color: Color(0xFF3B82F6),
                  size: 22,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  children: [
                     Text(
                      appointmentDetails.organizationName,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFF22C55E),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:  Text(
                        appointmentDetails.status,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Doctor
          Text(
            appointmentDetails.doctorName,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
          const SizedBox(height: 6),
          // Address
           Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 14, color: Colors.black45),
              const SizedBox(width: 4),
              Text(
                appointmentDetails.address,
                style: const TextStyle(fontSize: 12, color: Colors.black45),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Phone
           Row(
            children: [
              const Icon(Icons.phone_outlined, size: 14, color: Colors.black45),
              const SizedBox(width: 4),
              Text(
                appointmentDetails.phone,
                style: const TextStyle(fontSize: 12, color: Colors.black45),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // Action buttons
          Row(
            children: [
              Expanded(
                child: OutlineButton(
                  icon: Icons.visibility_outlined,
                  label: 'View Details',
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlineButton(
                  icon: Icons.sync,
                  label: 'Reschedule',
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlineButton(
                  icon: Icons.cancel_outlined,
                  label: 'Cancel',
                  onTap: () {},
                  isDestructive: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
