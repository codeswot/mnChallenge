import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_challenge/view/app_screen_pages.dart';
import 'package:moniepoint_challenge/view/styles/colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MN Challenge',
          theme: ThemeData(
            primarySwatch: Colors.orange,
            scaffoldBackgroundColor: AppColors.colorWhite,
            textTheme: GoogleFonts.poppinsTextTheme().apply(
              bodyColor: AppColors.color232220,
            ),
          ),
          home: child,
        );
      },
      child: const AppScreenPageView(),
    );
  }
}
