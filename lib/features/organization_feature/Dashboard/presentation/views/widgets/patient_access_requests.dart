import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'patient_request_item.dart';

class PatientAccessRequests extends StatelessWidget {
  const PatientAccessRequests({super.key});

  final List<Map<String, String>> requests = const [
    {
      'patientName': 'Emma Thompson',
      'timeAgo': '2 hours ago',
    },
    {
      'patientName': 'James Wilson',
      'timeAgo': '5 hours ago',
    },
    {
      'patientName': 'Lisa Anderson',
      'timeAgo': '1 day ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey, width: 1),
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Patient Access Requests',
            style: AppStyles.textStyle15W600Black,
          ),
          SizedBox(height: 12.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final request = requests[index];
              return PatientRequestItem(
                patientName: request['patientName']!,
                timeAgo: request['timeAgo']!,
              );
            },
          ),
        ],
      ),
    );
  }
}
