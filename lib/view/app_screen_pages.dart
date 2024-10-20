import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint_challenge/services/hepers/constants.dart';
import 'package:moniepoint_challenge/view/styles/icons.dart';
import 'package:moniepoint_challenge/view/widgets/widgets.dart';

class AppScreenPageView extends StatefulWidget {
  const AppScreenPageView({super.key});

  @override
  State<AppScreenPageView> createState() => _AppScreenPageViewState();
}

class _AppScreenPageViewState extends State<AppScreenPageView> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          pageScreens[currentIndex],
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigation(
              selectedIndex: currentIndex,
              items: [
                BottomNavigationItem(
                  icon: AppSvgIcons.search,
                ),
                BottomNavigationItem(
                  icon: AppSvgIcons.chat,
                ),
                BottomNavigationItem(
                  icon: AppSvgIcons.home,
                ),
                BottomNavigationItem(
                  icon: AppSvgIcons.heart,
                ),
                BottomNavigationItem(
                  icon: AppSvgIcons.user,
                ),
              ],
              onSelected: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ).animate().slideY(
                  begin: 1,
                  end: 0,
                  delay: 2900.ms,
                  duration: 900.ms,
                ),
          ),
        ],
      ),
    );
  }
}
