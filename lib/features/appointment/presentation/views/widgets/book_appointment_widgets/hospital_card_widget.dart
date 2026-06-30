import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';

/// ويدجت بطاقة المستشفى
/// تعرض: أيقونة المستشفى + الاسم + الـ tag + العنوان
class HospitalCardWidget extends StatelessWidget {

  const HospitalCardWidget({
    super.key,
    required this.hospitalName,
    required this.hospitalTag,
    required this.hospitalAddress,
  });
  final String hospitalName;
  final String hospitalTag;
  final String hospitalAddress;

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
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.iconBGBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.local_hospital_outlined,
              color: AppColors.primaryColor,
              size: 28,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      hospitalName,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textBlack,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Hospital Tag
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        hospitalTag,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textLightGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // العنوان
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: AppColors.textDarkGrey,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      hospitalAddress,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textDarkGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
