import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_view_widgets/appointment_tabs.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_view_widgets/appointments_header.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_view_widgets/appointments_summary.dart';

class AppointmentsViewBody extends StatelessWidget {
  const AppointmentsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          sliver: SliverMainAxisGroup(
            slivers: [
              const SliverToBoxAdapter(child: CustomAppBar()),
              const SliverToBoxAdapter(child: AppointmentsHeader()),
              SliverToBoxAdapter(child: 16.verticalSpace),
              const SliverToBoxAdapter(child: AppointmentsSummary()),
              SliverToBoxAdapter(child: 20.verticalSpace),
              const AppointmentTabs(),
              SliverToBoxAdapter(child: 100.verticalSpace),
            ],
          ),
        ),
      ],
    );
  }
}
