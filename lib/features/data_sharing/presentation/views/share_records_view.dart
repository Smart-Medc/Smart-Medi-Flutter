import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/share_records_view_widgets/share_records_view_body.dart';

class ShareRecordsView extends StatelessWidget {
  const ShareRecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: ShareRecordsViewBody(),
      ),
    );
  }
}

