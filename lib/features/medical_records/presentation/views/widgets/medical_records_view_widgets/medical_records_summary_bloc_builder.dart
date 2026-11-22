import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/medical_records/presentation/manager/get_medical_records_statistics_cubit/get_medical_records_statistics_cubit.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/medical_records_view_widgets/medical_records_summary.dart';

class MedicalRecordsSummaryBlocBuilder extends StatelessWidget {
  const MedicalRecordsSummaryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetMedicalRecordsStatisticsCubit,
      GetMedicalRecordsStatisticsState
    >(
      builder: (context, state) {
        if (state is GetMedicalRecordsStatisticsLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is GetMedicalRecordsStatisticsFailure) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 100.h),
              child: Center(child: Text(state.message)),
            ),
          );
        }

        if (state is GetMedicalRecordsStatisticsSuccess) {
          return SliverToBoxAdapter(child: MedicalRecordsSummary(statistics: state.statistics,));
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
