import 'package:flutter/material.dart';
import 'package:smart_medi/features/medication_management/data/models/get_medications_model/get_medication_response.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_data_list_sliver.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_data_slivers.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_data_utils.dart';

class MedicationDataContentSliverGroup extends StatefulWidget {
  const MedicationDataContentSliverGroup({
    super.key,
    required this.currentMedications,
    required this.pastMedications,
  });

  final List<MedicationModel> currentMedications;
  final List<MedicationModel> pastMedications;

  @override
  State<MedicationDataContentSliverGroup> createState() =>
      _MedicationDataContentSliverGroupState();
}

class _MedicationDataContentSliverGroupState
    extends State<MedicationDataContentSliverGroup> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final selectedMedications = _selectedTabIndex == 0
        ? widget.currentMedications
        : widget.pastMedications;

    return SliverMainAxisGroup(
      slivers: [
        MedicationDataHeaderSliver(
          selectedIndex: _selectedTabIndex,
          currentCount: widget.currentMedications.length,
          pastCount: widget.pastMedications.length,
          interactionsCount: getInteractionsCount(widget.currentMedications),
          adherencePercentage: getAverageAdherencePercentage(
            widget.currentMedications,
          ),
          onTabChanged: (index) {
            if (_selectedTabIndex == index) {
              return;
            }
            setState(() {
              _selectedTabIndex = index;
            });
          },
        ),
        MedicationDataListSliver(
          selectedTabIndex: _selectedTabIndex,
          medications: selectedMedications,
        ),
      ],
    );
  }
}

