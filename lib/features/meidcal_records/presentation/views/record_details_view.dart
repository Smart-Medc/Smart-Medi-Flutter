import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/features/meidcal_records/presentation/views/widgets/record_details_widgets/record_details_body.dart';

class RecordDetailsView extends StatelessWidget {
  const RecordDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_sharp, size: 40.sp),
          ),
        ),
        body: const RecordDetailsBody(),
      ),
    );
  }
}
