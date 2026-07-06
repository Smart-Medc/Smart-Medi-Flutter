import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/helpers/validator.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/custom_text_form_field.dart';
import 'package:smart_medi/features/medical_records/data/models/add_medical_record_models/add_medical_record_request.dart';
import 'package:smart_medi/features/medical_records/presentation/manager/add_medical_record_cubit/add_medical_record_cubit.dart';
import 'package:smart_medi/features/medical_records/presentation/manager/edit_medical_record_cubit/edit_medical_record_cubit.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/edit_record_widgets/edit_record_action_buttons.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/upload_new_document.dart';

class EditRecordContent extends StatefulWidget {
  const EditRecordContent({super.key, required this.isEdit, this.recordId});

  final bool isEdit;
  final String? recordId;

  @override
  State<EditRecordContent> createState() => _EditRecordContentState();
}

class _EditRecordContentState extends State<EditRecordContent> {
  final TextEditingController _recordTitleController = TextEditingController();
  final TextEditingController _recordTypeController = TextEditingController(
    text: 'Imaging',
  );
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _providerNameController = TextEditingController();
  final TextEditingController _orderedByController = TextEditingController();
  final TextEditingController _findingSummaryController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> _recordTypes = [
    'Lab Report',
    'Imaging',
    'Consultation Notes',
    'Immunization',
    'Prescription',
    'Surgery',
    'Pathology',
    'Other',
  ];

  @override
  void dispose() {
    _recordTitleController.dispose();
    _recordTypeController.dispose();
    _startDateController.dispose();
    _descriptionController.dispose();
    _providerNameController.dispose();
    _orderedByController.dispose();
    _findingSummaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CardContainer(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Basic Information',
                  style: AppStyles.textStyle24W600Black,
                ),
                16.verticalSpace,

                // Record Title
                _buildFieldLabel('Record Title', isRequired: true),
                8.verticalSpace,
                CustomTextFormField(
                  controller: _recordTitleController,
                  validator: (value) => Validator.requiredValidator(
                    value,
                    'Please enter a record title',
                  ),
                  hintText: 'Chest X-Ray',
                ),
                16.verticalSpace,

                // Record Type
                _buildFieldLabel('Record Type', isRequired: true),
                8.verticalSpace,
                CustomTextFormField.dropdown(
                  controller: _recordTypeController,
                  validator: (value) => Validator.requiredValidator(
                    value,
                    'Please select a record type',
                  ),
                  hintText: 'Select record type',
                  dropdownItems: _recordTypes,
                ),
                16.verticalSpace,

                // Start Date
                _buildFieldLabel('Start Date', isRequired: true),
                8.verticalSpace,
                CustomTextFormField.date(
                  controller: _startDateController,
                  validator: (value) => Validator.requiredValidator(
                    value,
                    'Please select a start date',
                  ),
                  hintText: '03/10/2024',
                ),
                16.verticalSpace,

                // Provider Name
                _buildFieldLabel('Provider Name'),
                8.verticalSpace,
                CustomTextFormField(
                  controller: _providerNameController,
                  hintText: 'Provider Name',
                ),
                16.verticalSpace,

                // Ordered by
                _buildFieldLabel('Ordered by'),
                8.verticalSpace,
                CustomTextFormField(
                  controller: _orderedByController,
                  hintText: 'Ordered by',
                ),
                16.verticalSpace,

                // Description
                _buildFieldLabel('Description'),
                8.verticalSpace,
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText:
                        'Chest X-ray imaging study for routine health screening.',
                    hintStyle: AppStyles.textStyle12W400DarkGrey,
                    filled: true,
                    fillColor: AppColors.formFieldBGColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        color: AppColors.formFieldStrokeColor,
                        width: 1.sp,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        color: AppColors.formFieldStrokeColor,
                        width: 1.sp,
                      ),
                    ),
                  ),
                ),
                16.verticalSpace,

                // Findings Summary
                _buildFieldLabel('Findings Summary'),
                8.verticalSpace,
                TextFormField(
                  controller: _findingSummaryController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText:
                        'Findings summary for the chest X-ray imaging study.',
                    hintStyle: AppStyles.textStyle12W400DarkGrey,
                    filled: true,
                    fillColor: AppColors.formFieldBGColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        color: AppColors.formFieldStrokeColor,
                        width: 1.sp,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        color: AppColors.formFieldStrokeColor,
                        width: 1.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          16.verticalSpace,
          const SizedBox(width: double.infinity, child: UploadNewDocument()),
          40.verticalSpace,
          EditRecordActionButtons(
            isEdit: widget.isEdit,
            onPrimaryPressed: () {
              if (_formKey.currentState!.validate()) {
                  final request = AddMedicalRecordRequest(
                    title: _recordTitleController.text.trim(),
                    recordDate: DateTime.parse(_startDateController.text),
                    recordType: _recordTypeController.text.trim() == 'Consultation Notes' ? 'ConsultationNotes' : _recordTypeController.text.trim(),

                    providerName: _providerNameController.text.trim().isEmpty
                        ? null
                        : _providerNameController.text.trim(),

                    orderedBy: _orderedByController.text.trim().isEmpty
                        ? null
                        : _orderedByController.text.trim(),

                    description: _descriptionController.text.trim().isEmpty
                        ? null
                        : _descriptionController.text.trim(),

                    findingsSummary: _findingSummaryController.text.trim().isEmpty
                        ? null
                        : _findingSummaryController.text.trim(),
                  );
                  if(widget.isEdit) {
                    context.read<EditMedicalRecordCubit>().editMedicalRecord(
                      addMedicalRecordRequest: request,
                      recordId: widget.recordId!,
                    );
                  } else {
                    context.read<AddMedicalRecordCubit>().addMedicalRecord(
                      addMedicalRecordRequest: request,
                    );
                  }


              }
            },
          ),
          60.verticalSpace,
        ],
      ),
    );
  }

  Widget _buildFieldLabel(String label, {bool isRequired = false}) {
    return RichText(
      text: TextSpan(
        text: label,
        style: AppStyles.textStyle14W400Black,
        children: isRequired
            ? [
                TextSpan(
                  text: ' *',
                  style: AppStyles.textStyle14W400Black.copyWith(
                    color: Colors.red,
                  ),
                ),
              ]
            : [],
      ),
    );
  }
}
