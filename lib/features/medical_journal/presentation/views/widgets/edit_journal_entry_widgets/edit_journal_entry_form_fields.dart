import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/helpers/validator.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/labeled_form_field.dart';
import 'package:smart_medi/features/medical_journal/data/models/add_journal_models/add_journal_request.dart';
import 'package:smart_medi/features/medical_journal/presentation/manager/edit_journal_cubit/edit_journal_cubit.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/add_journal_entry_widgets/add_journal_entry_action_buttons.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/add_journal_entry_widgets/add_journal_slider.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/add_journal_entry_widgets/multiline_entry_field.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/add_journal_entry_widgets/photo_upload_field.dart';

class EditJournalEntryFormFields extends StatefulWidget {
  const EditJournalEntryFormFields({
    super.key,
    required this.journalId,
    required this.initialTitle,
    required this.initialContent,
    required this.initialEntryDate,
    required this.initialMoodLevel,
    required this.initialPainLevel,
    required this.initialTags,
    required this.initialSymptoms,
  });

  final String journalId;
  final String initialTitle;
  final String initialContent;
  final DateTime initialEntryDate;
  final int initialMoodLevel;
  final int initialPainLevel;
  final List<String> initialTags;
  final List<String> initialSymptoms;

  @override
  State<EditJournalEntryFormFields> createState() =>
      _EditJournalEntryFormFieldsState();
}

class _EditJournalEntryFormFieldsState extends State<EditJournalEntryFormFields> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _entryController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();

  late double _moodLevel;
  late double _painLevel;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.initialTitle;
    _entryController.text = widget.initialContent;
    _tagsController.text = widget.initialTags.join(', ');
    _moodLevel = widget.initialMoodLevel.toDouble().clamp(0.0, 10.0);
    _painLevel = widget.initialPainLevel.toDouble().clamp(0.0, 10.0);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _entryController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: CardContainer(
          padding: EdgeInsets.all(24.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabeledFormField(
                  label: 'Title',
                  controller: _titleController,
                  hintText: 'e.g: Felt better than yesterday',
                  isRequired: true,
                  validator: (value) =>
                      Validator.requiredValidator(value, 'Title is required'),
                ),
                16.verticalSpace,
                MultilineEntryField(
                  label: 'Entry',
                  controller: _entryController,
                  hintText: 'Write your journal entry here',
                ),
                16.verticalSpace,
                AddJournalSlider(
                  icon: Icons.mood,
                  iconColor: AppColors.iconGreen,
                  value: _moodLevel,
                  onChanged: (value) {
                    setState(() {
                      _moodLevel = value;
                    });
                  },
                  label: 'Mood Level',
                  activeColor: AppColors.iconGreen,
                ),
                16.verticalSpace,
                AddJournalSlider(
                  icon: Icons.monitor_heart_outlined,
                  iconColor: AppColors.iconBlue,
                  value: _painLevel,
                  onChanged: (value) {
                    setState(() {
                      _painLevel = value;
                    });
                  },
                  label: 'Pain Level',
                  activeColor: AppColors.primaryColor,
                ),
                16.verticalSpace,
                const PhotoUploadField(
                  label: 'Photos (Optional, up to 5)',
                ),
                16.verticalSpace,
                LabeledFormField(
                  label: 'Tags (Optional, comma-separated)',
                  controller: _tagsController,
                  hintText: 'eg: Headache, medication, sleep',
                ),
                24.verticalSpace,
                AddJournalEntryActionButtons(
                  primaryButtonText: 'Save Changes',
                  onSavePressed: () => _submitEdit(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitEdit(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      context.showSnackBar(const Text('Please fill all required fields'));
      return;
    }

    final tags = _tagsController.text
        .split(',')
        .map((tag) => tag.trim())
        .where((tag) => tag.isNotEmpty)
        .toSet()
        .toList();

    final editJournalRequest = AddJournalRequest(
      title: _titleController.text.trim(),
      content: _entryController.text.trim(),
      entryDate: widget.initialEntryDate,
      moodLevel: _moodLevel.round(),
      painLevel: _painLevel.round(),
      symptoms: widget.initialSymptoms,
      tags: tags,
    );

    context.read<EditJournalCubit>().editJournalEntry(
          journalId: widget.journalId,
          editJournalRequest: editJournalRequest,
        );
  }
}