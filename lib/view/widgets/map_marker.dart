import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:moniepoint_challenge/view/styles/styles.dart';

// TODO: consider a proper State management
bool showLayer = true;

// Limitation to animating marker width directly, marker has to have a defined width and height to show
Marker buildMarker({
  required LatLng position,
  required String text,
}) {
  return Marker(
    point: position,
    width: showLayer ? 80.w : 40.w,
    height: 40.h,
    child: _AnimatedMarker(
      text: text,
    ),
  );
}

class _AnimatedMarker extends StatelessWidget {
  final String text;
  const _AnimatedMarker({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: showLayer ? 80.w : 40.w,
      decoration: BoxDecoration(
        color: AppColors.colorFC9D11,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          bottomRight: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      child: Center(
        child: showLayer
            ? Text(
                text,
                style: AppTypography.label.copyWith(
                  color: AppColors.colorWhite,
                  fontSize: 13.sp,
                ),
                maxLines: 1,
                overflow: TextOverflow.fade,
              ).animate().fade(
                  delay: 620.ms,
                  duration: 400.ms,
                )
            : Icon(
                Icons.business_rounded,
                color: AppColors.colorWhite,
                size: 25.sp,
              ).animate().fade(
                  delay: 620.ms,
                  duration: 400.ms,
                ),
      ),
    )
        .animate(
          delay: 600.ms,
        )
        .scaleX(
          duration: 800.ms,
          alignment: Alignment.centerLeft,
          begin: 0.5,
          end: 1,
        );
  }
}
