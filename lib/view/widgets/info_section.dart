import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_challenge/services/extensions/int_extension.dart';
import 'package:moniepoint_challenge/view/styles/styles.dart';

class AppInfoWidget extends StatelessWidget {
  const AppInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi,Marina',
            style: AppTypography.label.copyWith(
              fontSize: 17.sp,
            ),
          ).animate().fade(duration: 1500.ms, delay: 120.ms),
          SizedBox(
            height: 58.h,
            child: ClipRRect(
              child: Text(
                'Let\'s select your\nperfect place',
                style: AppTypography.body.copyWith(
                  fontSize: 26.sp,
                ),
              ).animate().slideY(
                    duration: 800.ms,
                    delay: 140.ms,
                    begin: 1,
                    end: 0,
                  ),
            ),
          ),
          SizedBox(height: 32.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const InfoWidget(
                title: 'BUY',
                subTitle: 'offers',
                contentCount: 1034,
                isCircle: true,
              ),
              SizedBox(width: 8.w),
              const InfoWidget(
                title: 'RENT',
                subTitle: 'offers',
                contentCount: 2212,
                backgroundColor: AppColors.colorWhite,
                textColor: AppColors.colorA4957E,
              ),
              Container(),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.contentCount,
    required this.subTitle,
    required this.title,
    this.backgroundColor,
    this.textColor,
    this.isCircle = false,
  });
  final String title;
  final int contentCount;
  final String subTitle;
  final bool isCircle;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 160.w,
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? null : BorderRadius.circular(12.r),
        color: backgroundColor ?? AppColors.colorFC9D11,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              title,
              style: AppTypography.label.copyWith(
                color: textColor ?? AppColors.colorWhite,
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TweenAnimationBuilder<int>(
                  tween: IntTween(begin: 0, end: contentCount),
                  duration: const Duration(seconds: 2),
                  builder: (context, value, child) {
                    return Text(
                      value.formatWithSeparator(separator: ' '),
                      style: AppTypography.body.copyWith(
                        color: textColor ?? AppColors.colorWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                      ),
                    );
                  },
                ),
                Text(
                  subTitle,
                  style: AppTypography.label.copyWith(
                    color: textColor ?? AppColors.colorWhite,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ).animate().scale(
          delay: 200.ms,
          duration: 800.ms,
        );
  }
}
