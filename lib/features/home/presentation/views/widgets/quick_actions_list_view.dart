import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/home/data/models/quick_actions_model.dart';
import 'package:smart_medi/features/home/presentation/views/widgets/quick_actions_item.dart';

class QuickActionsListView extends StatelessWidget {
  const QuickActionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quick Actions', style: AppStyles.textStyle24W700Black),
        SizedBox(
          height: 80.sp,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: QuickActionsModel.quickActions.length,
            itemBuilder: (context, index) {
              final action = QuickActionsModel.quickActions[index];
              return QuickActionsItem(
                title: action.title,
                onTap: () {
                  GoRouter.of(context).push(action.route);
                },
                subtitle: action.subtitle,
                containerColor: action.containerColor,
                iconColor: action.iconColor,
                icon: action.icon,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 16.w);
            },
          ),
        ),
      ],
    );
  }
}
