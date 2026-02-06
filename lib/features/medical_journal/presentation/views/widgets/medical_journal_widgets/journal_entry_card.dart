import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/icon_with_background.dart';

class JournalEntryCard extends StatelessWidget {
  const JournalEntryCard({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.description,
    required this.mood,
    required this.pain,
    this.tags = const [],
    this.onDelete,
  });

  final String title;
  final String date;
  final String time;
  final String description;
  final String mood;
  final String pain;
  final List<String> tags;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const IconWithBackground(
                icon: Icons.bookmarks_outlined,
                backgroundColor: AppColors.iconBGBlue,
                iconColor: AppColors.iconBlue,
              ),
              10.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    8.verticalSpace,
                    Text(title, style: AppStyles.textStyle15W600Black),
                    4.verticalSpace,
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 15.sp,
                          color: AppColors.textDarkGrey,
                        ),
                        4.horizontalSpace,
                        Text(
                          '$date  •  $time',
                          style: AppStyles.textStyle10W400DarkGrey,
                        ),
                      ],
                    ),
                    8.verticalSpace,
                    Text(
                      description,
                      style: AppStyles.textStyle10W400DarkGrey,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    12.verticalSpace,
                    Row(
                      children: [
                        _buildInfoChip(
                          icon: Icons.mood,
                          label: 'Mood: $mood',
                          color: AppColors.iconGreen,
                        ),
                        12.horizontalSpace,
                        _buildInfoChip(
                            icon: Icons.monitor_heart_outlined,
                          label: 'Pain: $pain',
                          color: AppColors.iconBlue,
                        ),
                        if (tags.isNotEmpty)
                          ...tags.map(
                                (tag) => Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.iconCyan,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Text(tag, style: AppStyles.textStyle12W500White),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onDelete,
                icon: Icon(
                  Icons.delete_outline,
                  color: AppColors.textBlack,
                  size: 15.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16.sp, color: color),
        4.horizontalSpace,
        Text(label, style: AppStyles.textStyle10W400Black),
      ],
    );
  }
}
