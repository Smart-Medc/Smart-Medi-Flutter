import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';

enum ItemMenuAction { edit, delete }

class ItemActionMenu extends StatelessWidget {
  const ItemActionMenu({
    super.key,
    this.onEdit,
    this.onDelete,
  });

  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ItemMenuAction>(
      tooltip: 'Actions',
      color: AppColors.whiteBackgroundColor,
      onSelected: (action) {
        if (action == ItemMenuAction.edit) {
          onEdit?.call();
          return;
        }
        onDelete?.call();
      },
      itemBuilder: (context) =>  [
         PopupMenuItem<ItemMenuAction>(
          value: ItemMenuAction.edit,
          child: Row(
            children: [
              Icon(Icons.edit, size: 16.sp),
              SizedBox(width: 8.w),
              const Text('Edit'),
            ],
          ),
        ),
        PopupMenuItem<ItemMenuAction>(
          value: ItemMenuAction.delete,
          child: Row(
            children: [
              Icon(Icons.delete, size: 16.sp),
              SizedBox(width: 8.w),
              const Text('Delete'),            ],
          ),
        ),
      ],
      child: Icon(
        Icons.more_vert,
        size: 20.w,
        color: AppColors.textBlack,
      ),
    );
  }
}

