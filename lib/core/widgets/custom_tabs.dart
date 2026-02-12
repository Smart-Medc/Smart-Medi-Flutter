import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class CustomTabs extends StatefulWidget { // If true, tabs scroll horizontally; if false, tabs expand to fill width

  const CustomTabs({
    super.key,
    required this.tabTitles,
    required this.tabContents,
    this.initialTab = 0,
    this.badgeCounts,
    this.isScrollable = false,
  }) : assert(tabTitles.length == tabContents.length,
            'Tab titles and contents must have the same length'),
       assert(badgeCounts == null || badgeCounts.length == tabTitles.length,
            'Badge counts must have the same length as tab titles');
  final List<String> tabTitles;
  final List<Widget> tabContents;
  final int initialTab;
  final List<int>? badgeCounts; // Optional badge counts for each tab (default 0)
  final bool isScrollable;

  @override
  State<CustomTabs> createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {
  late int _selectedTab;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialTab;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.formFieldBGColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: widget.isScrollable
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      widget.tabTitles.length,
                      (index) => _buildTabButton(
                        title: widget.tabTitles[index],
                        index: index,
                        badgeCount: widget.badgeCounts?[index] ?? 0,
                        isExpanded: false,
                      ),
                    ),
                  ),
                )
              : Row(
                  children: List.generate(
                    widget.tabTitles.length,
                    (index) => Expanded(
                      child: _buildTabButton(
                        title: widget.tabTitles[index],
                        index: index,
                        badgeCount: widget.badgeCounts?[index] ?? 0,
                        isExpanded: true,
                      ),
                    ),
                  ),
                ),
        ),
        16.verticalSpace,
        widget.tabContents[_selectedTab],
      ],
    );
  }

  Widget _buildTabButton({
    required String title,
    required int index,
    int badgeCount = 0,
    required bool isExpanded,
  }) {
    final isSelected = _selectedTab == index;
    final showBadge = badgeCount > 0;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        margin: EdgeInsets.all(6.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.textWhite : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: isSelected
                  ? AppStyles.textStyle12W500Black
                  : AppStyles.textStyle12W500DarkGrey,
              textAlign: TextAlign.center,
            ),
            if (showBadge) ...[
              6.horizontalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.iconRed,
                  borderRadius: BorderRadius.circular(999.r),
                ),
                constraints: BoxConstraints(minWidth: 18.w),
                child: Center(
                  child: Text(
                    badgeCount > 99 ? '+99' : badgeCount.toString(),
                    style: AppStyles.textStyle10W400White
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

