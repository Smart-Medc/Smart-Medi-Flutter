import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class PatientInfoCard extends StatelessWidget {
  const PatientInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.iconBGBlue,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person_outline, color: AppColors.primaryColor, size: 24.sp),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Emma Thompson', style: AppStyles.textStyle15W600Black),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: AppColors.iconBGRed,
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(color: AppColors.iconRed.withOpacity(0.3)),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.visibility_outlined, color: AppColors.iconRed, size: 12.sp),
                              SizedBox(width: 4.w),
                              Text('READ ONLY', 
                                style: AppStyles.textStyle10W400LightGrey.copyWith(
                                  color: AppColors.iconRed,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text('Age: 32  •  Female  •  Blood Type: A+', 
                      style: AppStyles.textStyle10W400LightGrey),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          _buildInfoItem('Email', 'emma.thompson@email.com'),
          SizedBox(height: 12.h),
          _buildInfoItem('Phone', '+1 (555) 123-4567'),
          SizedBox(height: 12.h),
          _buildInfoItem('Date of Birth', 'Jan 15, 1992'),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.textStyle10W400LightGrey),
        SizedBox(height: 4.h),
        Text(value, style: AppStyles.textStyle12W600Black),
      ],
    );
  }
}
