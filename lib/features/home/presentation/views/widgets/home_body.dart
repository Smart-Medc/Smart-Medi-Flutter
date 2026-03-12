import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/app_search_bar.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
import 'package:smart_medi/features/home/presentation/views/widgets/home_header.dart';
import 'package:smart_medi/features/home/presentation/views/widgets/home_health_stats.dart';
import 'package:smart_medi/features/home/presentation/views/widgets/home_medication_reminder.dart';
import 'package:smart_medi/features/home/presentation/views/widgets/home_view_upcoming.dart';
import 'package:smart_medi/features/home/presentation/views/widgets/quick_actions_list_view.dart';
import 'package:smart_medi/features/home/presentation/views/widgets/home_view_recent_records.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(left: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 25.w),
              child: const CustomAppBar(),
            ),
            const HomeHeader(),
            Padding(
              padding: EdgeInsets.only(right: 25.w),
              child: const AppSearchBar(hintText: 'Search doctors'),
            ),
            const QuickActionsListView(),
            24.verticalSpace,
            Text('Info', style: AppStyles.textStyle24W700Black),
            12.verticalSpace,
            const HomeViewRecentRecords(),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.only(right: 25.w),
              child: const HomeHealthStats(),
            ),
            16.verticalSpace,
            const HomeViewUpcoming(),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.only(right: 25.w),
              child: const HomeMedicationReminder(
                medicationName: 'Lisinopril',
                dosage: '10mg',
                time: '08:00 PM',
              ),
            ),
            50.verticalSpace,
          ],
        ),
      ),
    );
  }
}
