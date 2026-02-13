import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/summary_item.dart';

class SummaryBox extends StatelessWidget {
  const SummaryBox({
    super.key,
    this.title = 'Summary',
    required this.items,
    this.titleStyle,
    this.padding,
    this.horizontalSpacing,
    this.verticalSpacing,
  }) : assert(items.length == 4, 'SummaryBox requires exactly 4 items');

  final String title;
  final List<SummaryBoxItem> items;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry? padding;
  final double? horizontalSpacing;
  final double? verticalSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle ?? AppStyles.textStyle24W600Black,
        ),
        12.verticalSpace,
        CardContainer(
          padding: padding ?? EdgeInsets.only(left: 28.w, right: 80.w, top: 22.h, bottom: 22.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  items[0]._buildItem(),
                  (verticalSpacing ?? 20).verticalSpace,
                  items[1]._buildItem(),
                ],
              ),
              (horizontalSpacing ?? 0).horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  items[2]._buildItem(),
                  (verticalSpacing ?? 20).verticalSpace,
                  items[3]._buildItem(),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class SummaryBoxItem {
  const SummaryBoxItem._({
    required this.title,
    required this.value,
    this.icon,
    this.backgroundColor,
    this.iconColor,
    this.hasLine = false,
  });

  /// Create a summary item with icon and background
  const SummaryBoxItem.icon({
    required String title,
    required String value,
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
  }) : this._(
         title: title,
         value: value,
         icon: icon,
         backgroundColor: backgroundColor,
         iconColor: iconColor,
         hasLine: false,
       );

  /// Create a summary item with blue line
  const SummaryBoxItem.line({
    required String title,
    required String value,
  }) : this._(
         title: title,
         value: value,
         hasLine: true,
       );

  final String title;
  final String value;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final bool hasLine;

  Widget _buildItem() {
    if (hasLine) {
      return SummaryItem.line(
        title: title,
        value: value,
      );
    } else {
      return SummaryItem.icon(
        title: title,
        value: value,
        icon: icon!,
        backgroundColor: backgroundColor!,
        iconColor: iconColor!,
      );
    }
  }
}

