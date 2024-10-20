import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({required this.icon, this.color, this.size, super.key});
  final String icon;
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      color: color,
      width: size?.w,
      height: size?.w,
    );
  }
}
