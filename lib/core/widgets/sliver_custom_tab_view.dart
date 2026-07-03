import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class SliverCustomTabView extends StatefulWidget {
  const SliverCustomTabView({
    super.key,
    required this.tabTitles,
    required this.tabContents,
    this.initialTab = 0,
    this.badgeCounts,
    this.isScrollable = false,
    this.isNotificationsTab = false,
  })  : assert(
  tabTitles.length == tabContents.length,
  'Tab titles and contents must have the same length',
  ),
        assert(
        badgeCounts == null || badgeCounts.length == tabTitles.length,
        'Badge counts must have the same length as tab titles',
        );

  final List<String> tabTitles;

  /// Each entry must be a Sliver widget (SliverList, SliverGrid,
  /// SliverToBoxAdapter, etc.) — NOT a box widget like Column or ListView.
  final List<Widget> tabContents;

  final int initialTab;
  final List<int>? badgeCounts;
  final bool isScrollable;
  final bool? isNotificationsTab;

  @override
  State<SliverCustomTabView> createState() => _SliverCustomTabViewState();
}

class _SliverCustomTabViewState extends State<SliverCustomTabView> {
  late int _selectedTab;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialTab;
  }

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        // ── Tab bar ──────────────────────────────────────────────────────────
        SliverToBoxAdapter(
          child: Column(
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
            ],
          ),
        ),

        // ── Active tab content (must be a sliver) ────────────────────────────
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
    final showNotificationsBadge =
        badgeCount > 0 && widget.isNotificationsTab == true;
    final showSharingBadge =
        badgeCount > 0 && widget.isNotificationsTab == false;

    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
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
              !showSharingBadge
                  ? title
                  : '$title (${badgeCount > 99 ? '+99' : badgeCount})',
              style: isSelected
                  ? AppStyles.textStyle12W500Black
                  : AppStyles.textStyle12W500DarkGrey,
              textAlign: TextAlign.center,
            ),
            if (showNotificationsBadge) ...[
              6.horizontalSpace,
              Container(
                padding:
                EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.iconRed,
                  borderRadius: BorderRadius.circular(999.r),
                ),
                constraints: BoxConstraints(minWidth: 18.w),
                child: Center(
                  child: Text(
                    badgeCount > 99 ? '+99' : badgeCount.toString(),
                    style: AppStyles.textStyle10W400White,
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