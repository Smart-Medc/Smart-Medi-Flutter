class JournalEntryModel {
  const JournalEntryModel({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.description,
    required this.mood,
    required this.pain,
    required this.fullEntry,
    this.symptoms = const [],
    this.tags = const [],
  });

  // Factory constructor to create from JSON
  factory JournalEntryModel.fromJson(Map<String, dynamic> json) {
    return JournalEntryModel(
      id: json['id'] as String,
      title: json['title'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      description: json['description'] as String,
      mood: json['mood'] as String,
      pain: json['pain'] as String,
      fullEntry: json['fullEntry'] as String,
      symptoms: (json['symptoms'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
    );
  }

  final String id;
  final String date;
  final String time;
  final String title;
  final String description;
  final String mood;
  final String pain;
  final String fullEntry;
  final List<String> symptoms;
  final List<String> tags;

  // Method to convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'time': time,
      'description': description,
      'mood': mood,
      'pain': pain,
      'fullEntry': fullEntry,
      'symptoms': symptoms,
      'tags': tags,
    };
  }

  // CopyWith method for immutability
  JournalEntryModel copyWith({
    String? id,
    String? title,
    String? date,
    String? time,
    String? description,
    String? mood,
    String? pain,
    String? fullEntry,
    List<String>? symptoms,
    List<String>? tags,
  }) {
    return JournalEntryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      time: time ?? this.time,
      description: description ?? this.description,
      mood: mood ?? this.mood,
      pain: pain ?? this.pain,
      fullEntry: fullEntry ?? this.fullEntry,
      symptoms: symptoms ?? this.symptoms,
      tags: tags ?? this.tags,
    );
  }
}

