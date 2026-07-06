import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

/// Action buttons for shared record item (Copy Link and Revoke Access)
class SharedRecordActions extends StatelessWidget {
  const SharedRecordActions({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildCopyLinkButton(context),
        ),
        12.horizontalSpace,
        Expanded(
          child: _buildRevokeButton(context),
        ),
      ],
    );
  }

  Widget _buildCopyLinkButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Clipboard.setData(
          ClipboardData(text: url),
        );
        context.showSnackBar(const Text('Link copied to clipboard'));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.formFieldBGColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.link, size: 18.sp, color: AppColors.textBlack),
            8.horizontalSpace,
            Text('Copy Link', style: AppStyles.textStyle14W400Black),
          ],
        ),
      ),
    );
  }

  Widget _buildRevokeButton(BuildContext context) {
    return InkWell(
      // onTap: () => _showRevokeDialog(context),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.iconBGRed,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.block, size: 18.sp, color: AppColors.iconRed),
            8.horizontalSpace,
            Text(
              'Revoke Access',
              style: AppStyles.textStyle14W400Black.copyWith(
                color: AppColors.iconRed,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _showRevokeDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('Revoke Access'),
  //       content: Text('Are you sure you want to revoke access for $sharedWith?'),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: const Text('Cancel'),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               const SnackBar(
  //                 content: Text('Access revoked successfully'),
  //                 duration: Duration(seconds: 2),
  //               ),
  //             );
  //           },
  //           style: TextButton.styleFrom(foregroundColor: AppColors.iconRed),
  //           child: const Text('Revoke'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

