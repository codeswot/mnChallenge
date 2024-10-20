import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_challenge/view/styles/colors.dart';
import 'package:moniepoint_challenge/view/widgets/app_icon.dart';

class CustomBottomNavigation extends StatelessWidget {
  final List<BottomNavigationItem> items;
  final Color? backgroundColor;
  final double iconSize;
  final Color activeColor;
  final Color inactiveColor;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const CustomBottomNavigation({
    super.key,
    required this.items,
    this.backgroundColor,
    this.iconSize = 5.0,
    this.activeColor = AppColors.colorFC9D11,
    this.inactiveColor = AppColors.color232220,
    this.selectedIndex = 0,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 55.w).copyWith(bottom: 25.h),
        height: 55.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.color2B2B2B,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            items.length,
            (index) {
              final item = items[index];
              final isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  onSelected(index);
                },
                child: Container(
                  width: 42.w,
                  height: 42.w,
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? activeColor : inactiveColor,
                  ),
                  child: AppIcon(
                    icon: item.icon,
                    color: AppColors.colorWhite,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class BottomNavigationItem {
  final String icon;

  final VoidCallback? onTap;

  BottomNavigationItem({
    required this.icon,
    this.onTap,
  });
}
