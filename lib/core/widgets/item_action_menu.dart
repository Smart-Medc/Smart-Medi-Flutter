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
      itemBuilder: (context) => const [
        PopupMenuItem<ItemMenuAction>(
          value: ItemMenuAction.edit,
          child: Text('Edit'),
        ),
        PopupMenuItem<ItemMenuAction>(
          value: ItemMenuAction.delete,
          child: Text('Delete'),
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

