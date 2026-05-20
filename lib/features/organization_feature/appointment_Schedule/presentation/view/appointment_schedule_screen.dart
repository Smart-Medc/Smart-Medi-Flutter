import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/organization_feature/appointment_Schedule/data/model/appointment_schedule_model.dart';
import 'package:smart_medi/features/organization_feature/appointment_Schedule/presentation/view/widgets/app_top_bar.dart';
import 'package:smart_medi/features/organization_feature/appointment_Schedule/presentation/view/widgets/calendar_nav_header.dart';
import 'package:smart_medi/features/organization_feature/appointment_Schedule/presentation/view/widgets/day_view_timeline.dart';
import 'package:smart_medi/features/organization_feature/appointment_Schedule/presentation/view/widgets/month_view.dart';
import 'package:smart_medi/features/organization_feature/appointment_Schedule/presentation/view/widgets/schedule_page_header.dart';
import 'package:smart_medi/features/organization_feature/appointment_Schedule/presentation/view/widgets/view_toggle_tabs.dart';
import 'package:smart_medi/features/organization_feature/appointment_Schedule/presentation/view/widgets/week_view.dart';



class AppointmentScheduleView extends StatefulWidget {
  const AppointmentScheduleView({super.key});

  @override
  State<AppointmentScheduleView> createState() =>
      _AppointmentScheduleViewState();
}

class _AppointmentScheduleViewState
    extends State<AppointmentScheduleView> {
  ScheduleView _selectedView = ScheduleView.day;

  String get _navSubtitle {
    switch (_selectedView) {
      case ScheduleView.day:
        return '31 Saturday';
      case ScheduleView.week:
        return 'Week View';
      case ScheduleView.month:
        return 'Month View';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackgroundColor,
      appBar: const AppTopBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),

            // ── Page header: title + Export / Print ──────────────────
            const SchedulePageHeader(),

            SizedBox(height: 16.h),

            // ── Calendar navigation header ────────────────────────────
            CalendarNavHeader(
              monthYear: 'January 2026',
              subtitle: _navSubtitle,
              onPrevious: () {},
              onNext: () {},
            ),

            SizedBox(height: 12.h),

            // ── Day / Week / Month toggle tabs ────────────────────────
            ViewToggleTabs(
              selectedView: _selectedView,
              onViewChanged: (view) => setState(() => _selectedView = view),
            ),

            SizedBox(height: 16.h),

            // ── Animated view content ────────────────────────────────
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: _buildViewContent(),
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildViewContent() {
    switch (_selectedView) {
      case ScheduleView.day:
        return  DayViewTimeline(
          key: ValueKey('day'),
          appointments: AppointmentData.dayAppointments,
        );
      case ScheduleView.week:
        return  WeekViewList(
          key: ValueKey('week'),
          weekData: AppointmentData.weekAppointments,
        );
      case ScheduleView.month:
        return Column(
          key: const ValueKey('month'),
          children: [
            const MonthCalendarGrid(),
            SizedBox(height: 16.h),
            const StatusLegendCard(),
          ],
        );
    }
  }
}
