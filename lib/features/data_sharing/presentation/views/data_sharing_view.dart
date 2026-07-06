import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/app_drawer.dart';
import 'package:smart_medi/features/data_sharing/data/repos/data_sharing_repo.dart';
import 'package:smart_medi/features/data_sharing/presentation/manager/get_shared_records_cubit/get_shared_records_cubit.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/data_sharing_view_widgets/data_sharing_view_body.dart';

class DataSharingView extends StatelessWidget {
  const DataSharingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: BlocProvider(
          create: (context) => GetSharedRecordsCubit(getIt<DataSharingRepo>())..getSharedRecords(),
          child: const DataSharingViewBody(),
        ),
        drawer: const AppDrawer(selectedItem: DrawerItem.dataSharing),
      ),
    );
  }
}
