import 'dart:typed_data';

/// A document staged locally for the organization sign-up form, before it's
/// bundled into the multipart request on final submit.
class PickedDocument {
  const PickedDocument({
    required this.name,
    required this.sizeLabel,
    this.filePath,
    this.bytes,
    this.sourceUrl,
    this.type = 'Other',
  });

  final String name;
  final String sizeLabel;

  /// Local file path (mobile/desktop). Null on web or when fetched from a URL.
  final String? filePath;

  /// Raw bytes (web picks, or files fetched from a URL). Null when [filePath]
  /// is used instead.
  final Uint8List? bytes;

  /// Set when the document was added via "upload from URL" instead of the
  /// file picker.
  final String? sourceUrl;

  /// Maps to the API's `DocumentTypes` field. There's no per-file type
  /// picker in the current UI, so this defaults to 'Other'.
  final String type;
}
