import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';
import 'package:smart_medi/core/widgets/custom_text_form_field.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/data/models/picked_document.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/views/widgets/document_list_item.dart';
import 'package:smart_medi/features/organization_feature/organization_sign_up/presentation/views/widgets/organization_step_back_button.dart';

/// Step 3 of the organization sign-up wizard.
///
/// NOTE: there's no separate "upload document" endpoint — all documents are
/// sent together with the rest of the form on final submit. So files picked
/// here are only staged locally; the "Ready" status just means "selected",
/// not "already uploaded".
class OrganizationDocumentsStep extends StatefulWidget {
  const OrganizationDocumentsStep({
    super.key,
    required this.documents,
    required this.onDocumentsChanged,
    required this.onSubmit,
    required this.isSubmitting,
    required this.onBack,
  });

  final List<PickedDocument> documents;
  final ValueChanged<List<PickedDocument>> onDocumentsChanged;
  final VoidCallback onSubmit;
  final bool isSubmitting;
  final VoidCallback onBack;

  @override
  State<OrganizationDocumentsStep> createState() => _OrganizationDocumentsStepState();
}

class _OrganizationDocumentsStepState extends State<OrganizationDocumentsStep> {
  final TextEditingController _urlController = TextEditingController();
  bool _isFetchingUrl = false;

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  String _formatBytes(int bytes) {
    if (bytes <= 0) return '0MB';
    final mb = bytes / (1024 * 1024);
    return '${mb.toStringAsFixed(1)}MB';
  }

  Future<void> _pickFiles() async {
    final result = await FilePicker.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'mp4'],
      withData: true, // needed for web; harmless extra memory use elsewhere
    );
    if (result == null) return;

    final newDocs = result.files.map((file) {
      return PickedDocument(
        name: file.name,
        sizeLabel: _formatBytes(file.size),
        filePath: file.path,
        bytes: file.bytes,
      );
    }).toList();

    widget.onDocumentsChanged([...widget.documents, ...newDocs]);
  }

  Future<void> _uploadFromUrl() async {
    final url = _urlController.text.trim();
    if (url.isEmpty) return;

    setState(() => _isFetchingUrl = true);
    try {
      final response = await Dio().get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      final bytes = Uint8List.fromList(response.data ?? []);
      var name = Uri.parse(url).pathSegments.isNotEmpty
          ? Uri.parse(url).pathSegments.last
          : 'document';
      if (name.isEmpty) name = 'document';

      widget.onDocumentsChanged([
        ...widget.documents,
        PickedDocument(
          name: name,
          sizeLabel: _formatBytes(bytes.length),
          bytes: bytes,
          sourceUrl: url,
        ),
      ]);
      _urlController.clear();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not fetch a file from that URL')),
        );
      }
    } finally {
      if (mounted) setState(() => _isFetchingUrl = false);
    }
  }

  void _removeDocument(int index) {
    final updated = [...widget.documents]..removeAt(index);
    widget.onDocumentsChanged(updated);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrganizationStepBackButton(onTap: widget.onBack),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFFD1D5DB)),
          ),
          child: Column(
            children: [
              Icon(
                Icons.insert_drive_file_outlined,
                size: 32.sp,
                color: const Color(0xFF9CA3AF),
              ),
              12.verticalSpace,
              Text('Drag and drop your files', style: AppStyles.textStyle14W400Black),
              6.verticalSpace,
              Text(
                'JPEG, PNG, PDF, and MP4 formats, up to 50MB',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade500),
              ),
              14.verticalSpace,
              OutlinedButton(
                onPressed: _pickFiles,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFD1D5DB)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: const Text('Select File'),
              ),
            ],
          ),
        ),
        16.verticalSpace,
        Text('or upload from URL', style: AppStyles.textStyle14W400Black),
        8.verticalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomTextFormField(
                hintText: 'Add file URL',
                controller: _urlController,
              ),
            ),
            8.horizontalSpace,
            SizedBox(
              height: 56.h,
              child: ElevatedButton(
                onPressed: _isFetchingUrl ? null : _uploadFromUrl,
                child: _isFetchingUrl
                    ? SizedBox(
                  width: 16.w,
                  height: 16.w,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
                    : const Text('Upload'),
              ),
            ),
          ],
        ),
        if (widget.documents.isNotEmpty) ...[
          20.verticalSpace,
          Text('Uploaded Files', style: AppStyles.textStyle14W400Black),
          10.verticalSpace,
          ...List.generate(widget.documents.length, (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: DocumentListItem(
                document: widget.documents[index],
                onDelete: () => _removeDocument(index),
              ),
            );
          }),
        ],
        24.verticalSpace,
        CustomButton(
          text: 'Sign up',
          onPressed: widget.isSubmitting ? null : widget.onSubmit,
        ),
      ],
    );
  }
}