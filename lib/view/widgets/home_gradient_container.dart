import 'package:flutter/material.dart';
import 'package:moniepoint_challenge/view/styles/colors.dart';

class HomeGradientContainer extends StatelessWidget {
  const HomeGradientContainer({
    required this.child,
    super.key,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.homeColorsGradient,
          stops: [0.2, 0.6, 1.0],
        ),
      ),
      child: SafeArea(bottom: false, child: child),
    );
  }
}
