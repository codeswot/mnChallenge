import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_challenge/view/styles/colors.dart';
import 'package:moniepoint_challenge/view/styles/typography.dart';
import 'package:moniepoint_challenge/view/widgets/app_icon.dart';

class MapButton extends StatelessWidget {
  const MapButton({
    required this.icon,
    required this.text,
    this.onTap,
    super.key,
  });
  final String icon;
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: SizedBox(
                width: 150.w,
                height: 40.h,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 150.w,
                height: 40.h,
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color: AppColors.colorWhite.withOpacity(0.4),
                ),
                child: Row(
                  children: [
                    AppIcon(
                      icon: icon,
                      color: AppColors.colorWhite,
                      size: 15.w,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      text,
                      style: AppTypography.label.copyWith(
                        color: AppColors.colorWhite,
                        fontSize: 13.sp,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ).animate().scale(
            duration: 600.ms,
          ),
    );
  }
}

class CircularMapButton extends StatelessWidget {
  const CircularMapButton({
    super.key,
    required this.icon,
    this.onTap,
  });
  final String icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.w),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: SizedBox(
                width: 40.w,
                height: 40.h,
              ),
            ),
          ),
          Container(
            width: 40.w,
            height: 40.h,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.colorWhite.withOpacity(0.4),
            ),
            child: AppIcon(
              icon: icon,
              color: Colors.white,
              size: 14.w,
            ),
          ),
        ],
      ),
    ).animate().scale(
          duration: 600.ms,
        );
  }
}
