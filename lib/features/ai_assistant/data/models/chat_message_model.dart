enum ChatSender { user, assistant }

class ChatMessageModel {
  const ChatMessageModel({
    required this.id,
    required this.text,
    required this.sender,
    required this.timestamp,
    this.usedMedicalRecords = false,
  });

  final String id;
  final String text;
  final ChatSender sender;
  final DateTime timestamp;

  /// Whether this reply was generated using the patient's medical records
  /// as context. Set this from the API response once the endpoint is wired up.
  final bool usedMedicalRecords;

  bool get isUser => sender == ChatSender.user;

  String get formattedTime {
    final hour = timestamp.hour % 12 == 0 ? 12 : timestamp.hour % 12;
    final minute = timestamp.minute.toString().padLeft(2, '0');
    final period = timestamp.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }
}
