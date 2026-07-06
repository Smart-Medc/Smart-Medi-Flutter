import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/action_buttons.dart';
import 'package:smart_medi/features/data_sharing/presentation/manager/revoke_access_cubit/revoke_access_cubit.dart';

class SharedRecordActions extends StatelessWidget {
  const SharedRecordActions({
    super.key,
    required this.url, required this.codeId, required this.code,
  });

  final String url;
  final String code;
  final String codeId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildCopyLinkButton(context),
        ),
        12.horizontalSpace,
        Expanded(
          child: InkWell(
            onTap: () {
              context.showCustomDialog(
                title: const Text('Revoke Access'),
                content: ActionButtons(
                  primaryButtonText: 'Revoke',
                  onPrimaryPressed: () {
                    GoRouter.of(context).pop();
                    context
                        .read<RevokeAccessCubit>()
                        .revokeAccess(codeId: codeId);
                  },
                ),
              );
            },
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
          ),
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
}

