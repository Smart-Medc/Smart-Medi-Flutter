import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/meidcal_records/presentation/views/widgets/record_details_widgets/record_details_body.dart';

class RecordDetailsView extends StatelessWidget {
  const RecordDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: RecordDetailsBody(),
      ),
    );
  }
}
