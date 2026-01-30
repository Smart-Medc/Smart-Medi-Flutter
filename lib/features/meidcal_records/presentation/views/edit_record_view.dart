import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/features/meidcal_records/presentation/views/widgets/edit_record_widgets/edit_record_body.dart';

class EditRecordView extends StatelessWidget {
  const EditRecordView({super.key});

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
        body: const EditRecordBody(),
      ),
    );
  }
}

