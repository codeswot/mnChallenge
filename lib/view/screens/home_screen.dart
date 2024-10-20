import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_challenge/services/hepers/constants.dart';
import 'package:moniepoint_challenge/view/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeGradientContainer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(),
            SizedBox(height: 32.h),
            const AppInfoWidget(),
            SizedBox(height: 32.h),
            const AppCatalogSection(items: catalogItems),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
