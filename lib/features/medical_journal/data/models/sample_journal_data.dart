import 'package:smart_medi/features/medical_journal/data/models/journal_entry_model.dart';

/// Sample journal entries for demonstration
class SampleJournalData {
  static final List<JournalEntryModel> entries = [
    const JournalEntryModel(
      id: '1',
      title: 'Feeling much better today',
      date: 'Mar 18, 2024',
      time: '10:30 AM',
      description: 'Woke up with more energy. The new medication seems to be working well ...',
      mood: '7.2',
      pain: '4.5',
      fullEntry:
          'Woke up with more energy today. The new medication seems to be working well. Pain levels have decreased significantly which is a relief. The doctor\'s advice about taking the medication with food is definitely helping with the nausea.\n\nHad a good night\'s sleep for the first time in days. No headaches this morning, which is a relief. The doctor\'s advice about taking the medication with food is definitely helping with the side effects.\n\nPlanning to go for a short walk this afternoon to test my energy levels. Will monitor how I feel and update if anything changes.',
      symptoms:  ['Headache'],
      tags:  ['Headache', 'Sleep', 'improvement'],
    ),
    const JournalEntryModel(
      id: '2',
      title: 'Morning Headache',
      date: 'Mar 17, 2024',
      time: '08:15 AM',
      description:
          'Started the day with a mild headache. Took prescribed medication and rested for an hour ...',
      mood: '6.0',
      pain: '5.0',
      fullEntry:
          'Started the day with a mild headache. Took prescribed medication and rested for an hour. The pain subsided gradually but didn\'t completely go away. Feeling slightly tired and low on energy today.\n\nThe headache started around 7 AM and peaked around 8:30 AM. After taking medication and resting, it reduced to a dull ache by noon. Will continue monitoring throughout the day.',
      symptoms: ['Headache', 'Fatigue'],
      tags: ['Headache', 'Medication'],
    ),
    const JournalEntryModel(
      id: '3',
      title: 'Good Sleep Quality',
      date: 'Mar 16, 2024',
      time: '09:00 PM',
      description:
          'Had a restful night with 8 hours of continuous sleep. Feeling refreshed in the morning ...',
      mood: '9.0',
      pain: '2.0',
      fullEntry:
          'Had a restful night with 8 hours of continuous sleep. Feeling refreshed in the morning. This is the best I\'ve felt in weeks.\n\nWent to bed at 11 PM and woke up naturally at 7 AM. No interruptions during the night. The new bedtime routine seems to be helping. Feel energized and ready for the day.',
      symptoms: [],
      tags: ['Sleep', 'Wellness'],
    ),
    const JournalEntryModel(
      id: '4',
      title: 'Afternoon Fatigue',
      date: 'Mar 15, 2024',
      time: '02:45 PM',
      description:
          'Experiencing unusual tiredness after lunch. Might need to adjust meal timing ...',
      mood: '5.0',
      pain: '4.0',
      fullEntry:
          'Experiencing unusual tiredness after lunch. Might need to adjust meal timing or composition. The fatigue hit around 2 PM and made it difficult to concentrate on work.\n\nConsidering switching to lighter lunches to avoid this afternoon slump. Will also try a short walk after eating to see if that helps with digestion and energy levels.Experiencing unusual tiredness after lunch. Might need to adjust meal timing or composition. The fatigue hit around 2 PM and made it difficult to concentrate on work.\n\nConsidering switching to lighter lunches to avoid this afternoon slump. Will also try a short walk after eating to see if that helps with digestion and energy levels.Experiencing unusual tiredness after lunch. Might need to adjust meal timing or composition. The fatigue hit around 2 PM and made it difficult to concentrate on work.\n\nConsidering switching to lighter lunches to avoid this afternoon slump. Will also try a short walk after eating to see if that helps with digestion and energy levels.Experiencing unusual tiredness after lunch. Might need to adjust meal timing or composition. The fatigue hit around 2 PM and made it difficult to concentrate on work.\n\nConsidering switching to lighter lunches to avoid this afternoon slump. Will also try a short walk after eating to see if that helps with digestion and energy levels.',
      symptoms: ['Fatigue', 'Drowsiness'],
      tags: ['Fatigue', 'Diet'],
    ),
  ];

  /// Get entry by ID
  static JournalEntryModel? getEntryById(String id) {
    try {
      return entries.firstWhere((entry) => entry.id == id);
    } on StateError {
      return null;
    }
  }

  /// Get entries by tag
  static List<JournalEntryModel> getEntriesByTag(String tag) {
    return entries.where((entry) => entry.tags.contains(tag)).toList();
  }

  /// Get entries by symptom
  static List<JournalEntryModel> getEntriesBySymptom(String symptom) {
    return entries.where((entry) => entry.symptoms.contains(symptom)).toList();
  }
}

