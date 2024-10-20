import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_challenge/view/styles/icons.dart';
import 'package:moniepoint_challenge/view/styles/styles.dart';
import 'package:moniepoint_challenge/view/widgets/app_icon.dart';
import 'package:shimmer/shimmer.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.colorWhite,
            ),
            child: Row(
              children: [
                AppIcon(
                  icon: AppSvgIcons.location,
                  color: AppColors.color232220.withOpacity(0.5),
                  size: 14.w,
                ),
                SizedBox(width: 4.w),
                Text(
                  'Saint Petersburg',
                  style: AppTypography.label.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ).animate().fade(delay: 600.ms, duration: 800.ms),
          ).animate().scaleX(duration: 800.ms, alignment: Alignment.centerLeft),
          Container(
            width: 45.w,
            height: 45.w,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: AppColors.headerAvatarGradient,
              ),
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: CachedNetworkImage(
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/biome-19b36.appspot.com/o/profile.png?alt=media&token=6d121c1f-886b-413a-b620-298b6395fb9d',
                fit: BoxFit.contain,
                progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
                  width: 40.w,
                  height: 40.w,
                  child: Shimmer.fromColors(
                    baseColor: AppColors.colorA4957E,
                    highlightColor: AppColors.colorFC9D11,
                    child: const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                    child: Icon(
                  Icons.person_2,
                  color: AppColors.colorWhite,
                )),
              ),
            ),
          ).animate().fadeIn(duration: 200.ms).scale(duration: 500.ms)
        ],
      ),
    );
  }
}
