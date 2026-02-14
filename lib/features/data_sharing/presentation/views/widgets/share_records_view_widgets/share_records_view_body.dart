import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/widgets/app_bar_back_button.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';
import 'package:smart_medi/features/data_sharing/data/models/record_type_model.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/share_records_view_widgets/share_records_form_fields.dart';

class ShareRecordsViewBody extends StatefulWidget {
  const ShareRecordsViewBody({super.key});

  @override
  State<ShareRecordsViewBody> createState() => _ShareRecordsViewBodyState();
}

class _ShareRecordsViewBodyState extends State<ShareRecordsViewBody> {
  late List<RecordTypeModel> recordTypes;
  final TextEditingController _expirationController = TextEditingController(text: '24 Hours');

  @override
  void initState() {
    super.initState();
    recordTypes = RecordTypeModel.getRecordTypes();
  }

  @override
  void dispose() {
    _expirationController.dispose();
    super.dispose();
  }

  List<String> _getAllSelectedRecords() {
    final List<String> allSelected = [];
    for (final type in recordTypes) {
      allSelected.addAll(type.getSelectedRecords);
    }
    return allSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarBackButton(),
          const AppHeader(title: 'Secure Data Sharing', subtitle: 'Control who can access your medical records'),
          20.verticalSpace,

          ShareRecordsFormFields(
            recordTypes: recordTypes,
            onUpdate: () => setState(() {}),
            expirationController: _expirationController,
            selectedRecords: _getAllSelectedRecords(),
          ),
          20.verticalSpace,
          CustomButton(
            text: 'Generate Access Code',
            onPressed: (){
              GoRouter.of(context).push(AppRoutes.codeGeneratedView);
            },
          ),
          30.verticalSpace,
        ],
      ),
    );
  }
}

