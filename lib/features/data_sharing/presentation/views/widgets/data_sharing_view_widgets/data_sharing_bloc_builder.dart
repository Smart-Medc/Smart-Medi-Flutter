import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/features/data_sharing/presentation/manager/get_shared_records_cubit/get_shared_records_cubit.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_view_widgets/data_sharing_content.dart';
class DataSharingBlocBuilder extends StatelessWidget {
  const DataSharingBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSharedRecordsCubit, GetSharedRecordsState>(
      builder: (context, state) {
        if (state is GetSharedRecordsLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is GetSharedRecordsFailure) {
          return SliverToBoxAdapter(
            child: Text(state.message),
          );
        }

        if (state is GetSharedRecordsSuccess) {
          return DataSharingContent(getSharedRecordsResponse: state.getSharedRecordsResponse);
        }

        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
