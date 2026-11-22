import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/features/data_sharing/presentation/manager/get_shared_records_cubit/get_shared_records_cubit.dart';
import 'package:smart_medi/features/data_sharing/presentation/manager/revoke_access_cubit/revoke_access_cubit.dart';
class DataSharingBlocListener extends StatelessWidget {
  const DataSharingBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<
        RevokeAccessCubit,
        RevokeAccessState>(
      listener: (context, state) {
        if (state is RevokeAccessSuccess) {
          context.showSnackBar(const Text('Access revoked successfully'));

          context.read<GetSharedRecordsCubit>().getSharedRecords();
        }

        if (state is RevokeAccessFailure) {
          context.showSnackBar(Text(state.message));
        }
      },

      child: child,
    );
  }
}
