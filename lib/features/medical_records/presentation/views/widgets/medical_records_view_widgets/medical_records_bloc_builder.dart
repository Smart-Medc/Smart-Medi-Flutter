import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/medical_records/presentation/manager/get_medical_records_cubit/get_medical_records_cubit.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/medical_records_view_widgets/medical_records_content.dart';

class MedicalRecordsBlocBuilder extends StatelessWidget {
  const MedicalRecordsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMedicalRecordsCubit, GetMedicalRecordsState>(
      builder: (context, state) {
        if (state is GetMedicalRecordsLoading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is GetMedicalRecordsFailure) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 100.h),
              child: Center(
                child: Text(state.message),
              ),
            ),
          );
        }

        if (state is GetMedicalRecordsSuccess) {
          return MedicalRecordsContent(medicalRecordsResponse: state.medicalRecordsResponse);
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}