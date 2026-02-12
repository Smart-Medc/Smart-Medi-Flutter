import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class CustomTabs extends StatefulWidget {
  final List<String> tabTitles;
  final List<Widget> tabContents;
  final int initialTab;

  const CustomTabs({
    super.key,
    required this.tabTitles,
    required this.tabContents,
    this.initialTab = 0,
  }) : assert(tabTitles.length == tabContents.length,
            'Tab titles and contents must have the same length');

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
          child: Row(
            children: List.generate(
              widget.tabTitles.length,
              (index) => Expanded(
                child: _buildTabButton(
                  title: widget.tabTitles[index],
                  index: index,
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

  Widget _buildTabButton({required String title, required int index}) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        margin: EdgeInsets.all(6.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.textWhite : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            title,
            style: isSelected
                ? AppStyles.textStyle12W500Black
                : AppStyles.textStyle12W500DarkGrey,
          ),
        ),
      ),
    );
  }
}

