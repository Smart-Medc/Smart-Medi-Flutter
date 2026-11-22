class GetJournalResponse {
  GetJournalResponse({
    required this.items,
    required this.totalCount,
    required this.pageNumber,
    required this.pageSize,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory GetJournalResponse.fromJson(Map<String, dynamic> json) {
    return GetJournalResponse(
      items: (json['items'] as List<dynamic>?)
              ?.map(
                (e) => JournalListItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          <JournalListItem>[],
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
      pageNumber: (json['pageNumber'] as num?)?.toInt() ?? 1,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 10,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
      hasNextPage: json['hasNextPage'] as bool? ?? false,
      hasPreviousPage: json['hasPreviousPage'] as bool? ?? false,
    );
  }

  final List<JournalListItem> items;
  final int totalCount;
  final int pageNumber;
  final int pageSize;
  final int totalPages;
  final bool hasNextPage;
  final bool hasPreviousPage;

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
      'totalCount': totalCount,
      'pageNumber': pageNumber,
      'pageSize': pageSize,
      'totalPages': totalPages,
      'hasNextPage': hasNextPage,
      'hasPreviousPage': hasPreviousPage,
    };
  }
}

class JournalListItem {
  JournalListItem({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.entryDate,
    required this.moodLevel,
    required this.painLevel,
    required this.symptoms,
    required this.tags,
    required this.hasPhotos,
    required this.photoCount,
    required this.createdAt,
  });

  factory JournalListItem.fromJson(Map<String, dynamic> json) {
    return JournalListItem(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      excerpt: json['excerpt']?.toString() ?? '',
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
      hasPhotos: json['hasPhotos'] as bool? ?? false,
      photoCount: (json['photoCount'] as num?)?.toInt() ?? 0,
      createdAt:
          DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
          DateTime.now(),
    );
  }

  final String id;
  final String title;
  final String excerpt;
  final DateTime entryDate;
  final int moodLevel;
  final int painLevel;
  final List<String> symptoms;
  final List<String> tags;
  final bool hasPhotos;
  final int photoCount;
  final DateTime createdAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'excerpt': excerpt,
      'entryDate': entryDate.toIso8601String(),
      'moodLevel': moodLevel,
      'painLevel': painLevel,
      'symptoms': symptoms,
      'tags': tags,
      'hasPhotos': hasPhotos,
      'photoCount': photoCount,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

