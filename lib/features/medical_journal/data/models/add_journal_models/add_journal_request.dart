class AddJournalRequest {
  AddJournalRequest({
    required this.title,
    required this.content,
    required this.entryDate,
    required this.moodLevel,
    required this.painLevel,
    required this.symptoms,
    required this.tags,
  });

  factory AddJournalRequest.fromJson(Map<String, dynamic> json) {
    return AddJournalRequest(
      title: json['title']?.toString() ?? '',
      content: json['content']?.toString() ?? '',
      entryDate:
          DateTime.tryParse(json['entryDate']?.toString() ?? '') ??
          DateTime.now(),
      moodLevel: (json['moodLevel'] as num?)?.toInt() ?? 0,
      painLevel: (json['painLevel'] as num?)?.toInt() ?? 0,
      symptoms: (json['symptoms'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          <String>[],
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          <String>[],
    );
  }

  final String title;
  final String content;
  final DateTime entryDate;
  final int moodLevel;
  final int painLevel;
  final List<String> symptoms;
  final List<String> tags;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'entryDate': entryDate.toIso8601String(),
      'moodLevel': moodLevel,
      'painLevel': painLevel,
      'symptoms': symptoms,
      'tags': tags,
    };
  }
}

