import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/core/widgets/app_search_bar.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
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
        padding: EdgeInsets.only(top: 68.h, left: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            32.verticalSpace,
            const AppHeader(title: 'Hi, Omar!', subtitle: 'How are you feeling today?'),
            const AppSearchBar(hintText: 'Search doctors',),
            const QuickActionsListView(),
            44.verticalSpace,
            Text('Info',style: AppStyles.textStyle24W700Black,),
            12.verticalSpace,
            const HomeViewRecentRecords(),
            20.verticalSpace,
            const HomeViewUpcoming(),
          ],
        ),
      ),
    );
  }
}
