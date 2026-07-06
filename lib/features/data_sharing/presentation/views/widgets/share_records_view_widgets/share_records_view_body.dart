import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/app_bar_back_button.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';
import 'package:smart_medi/features/data_sharing/data/models/record_type_model.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/share_records_view_widgets/share_records_form_fields.dart';
import 'package:smart_medi/features/medical_records/presentation/manager/get_medical_records_cubit/get_medical_records_cubit.dart';

class ShareRecordsViewBody extends StatefulWidget {
  const ShareRecordsViewBody({super.key});

  @override
  State<ShareRecordsViewBody> createState() => _ShareRecordsViewBodyState();
}

class _ShareRecordsViewBodyState extends State<ShareRecordsViewBody> {
  List<RecordTypeModel>? recordTypes;
  String? patientId;
  final TextEditingController _expirationController = TextEditingController(text: '24 Hours');

  @override
  void dispose() {
    _expirationController.dispose();
    super.dispose();
  }

  List<String> _getAllSelectedRecords() {
    if (recordTypes == null) return [];
    final List<String> allSelected = [];
    for (final type in recordTypes!) {
      allSelected.addAll(type.getSelectedRecords.map((record) => record.title));
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
          const AppHeader(
            title: 'Secure Data Sharing',
            subtitle: 'Control who can access your medical records',
          ),
          20.verticalSpace,

          BlocConsumer<GetMedicalRecordsCubit, GetMedicalRecordsState>(
            listener: (context, state) {
              if (state is GetMedicalRecordsSuccess) {
                recordTypes = RecordTypeModel.fromMedicalRecords(state.medicalRecordsResponse.items);
                patientId = state.patientId;
              }
            },
            builder: (context, state) {
              if (state is GetMedicalRecordsLoading || state is GetMedicalRecordsInitial) {
                return const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (state is GetMedicalRecordsFailure) {
                return Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            state.message,
                            style: AppStyles.textStyle14W400Black,
                            textAlign: TextAlign.center,
                          ),
                          12.verticalSpace,
                          CustomButton(
                            text: 'Retry',
                            onPressed: () => context.read<GetMedicalRecordsCubit>().getMedicalRecords(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              if (recordTypes == null || recordTypes!.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Text(
                      'No medical records found',
                      style: AppStyles.textStyle14W400Black,
                    ),
                  ),
                );
              }

              return ShareRecordsFormFields(
                recordTypes: recordTypes!,
                onUpdate: () => setState(() {}),
                expirationController: _expirationController,
                selectedRecords: _getAllSelectedRecords(),
              );
            },
          ),

          20.verticalSpace,
          CustomButton(
            text: 'Generate Access Code',
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.codeGeneratedView);
            },
          ),
          30.verticalSpace,
        ],
      ),
    );
  }
}