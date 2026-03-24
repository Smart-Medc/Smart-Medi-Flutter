import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/helpers/validator.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/labeled_form_field.dart';
import 'package:smart_medi/features/medical_journal/data/models/add_journal_models/add_journal_request.dart';
import 'package:smart_medi/features/medical_journal/presentation/manager/add_journal_cubit/add_journal_cubit.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/add_journal_entry_widgets/add_journal_entry_action_buttons.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/add_journal_entry_widgets/add_journal_slider.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/add_journal_entry_widgets/multiline_entry_field.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/add_journal_entry_widgets/photo_upload_field.dart';

class AddJournalEntryFormFields extends StatefulWidget {
  const AddJournalEntryFormFields({super.key});

  @override
  State<AddJournalEntryFormFields> createState() => _AddJournalEntryFormFieldsState();
}

class _AddJournalEntryFormFieldsState extends State<AddJournalEntryFormFields> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _entryController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();

  // Slider values
  double _moodLevel = 5.0;
  double _painLevel = 5.0;

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
              // Title field
              LabeledFormField(
                label: 'Title',
                controller: _titleController,
                hintText: 'e.g: Felt better than yesterday',
                isRequired: true,
                validator: (value) => Validator.requiredValidator(value, 'Title is required'),
              ),
              16.verticalSpace,
              // Entry field (multiline)
              MultilineEntryField(
                label: 'Entry',
                controller: _entryController,
                hintText: 'Write your journal entry here',
              ),
              16.verticalSpace,
              // Mood Level slider
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
              // Pain Level slider
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

              // Photos field
              const PhotoUploadField(
                label: 'Photos (Optional, up to 5)',
              ),
              16.verticalSpace,

              // Tags field
              LabeledFormField(
                label: 'Tags (Optional, comma-separated)',
                controller: _tagsController,
                hintText: 'eg: Headache, medication, sleep',
              ),
              24.verticalSpace,

              // Action buttons
              AddJournalEntryActionButtons(
                onSavePressed: () => _submitJournalEntry(context),
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitJournalEntry(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      context.showSnackBar(const Text('Please fill all required fields'));
      return;
    }

    // if (_entryController.text.trim().isEmpty) {
    //   context.showSnackBar(const Text('Entry is required'));
    //   return;
    // }

    final tags = _tagsController.text
        .split(',')
        .map((tag) => tag.trim())
        .where((tag) => tag.isNotEmpty)
        .toSet()
        .toList();

    final addJournalRequest = AddJournalRequest(
      title: _titleController.text.trim(),
      content: _entryController.text.trim(),
      entryDate: DateTime.now(),
      moodLevel: _moodLevel.round(),
      painLevel: _painLevel.round(),
      symptoms: const <String>[],
      tags: tags,
    );

    context.read<AddJournalCubit>().addJournalEntry(
      addJournalRequest: addJournalRequest,
    );
  }
}

