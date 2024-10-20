import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_challenge/services/hepers/constants.dart';
import 'package:moniepoint_challenge/view/styles/styles.dart';
import 'package:moniepoint_challenge/view/widgets/app_icon.dart';
import 'package:moniepoint_challenge/view/widgets/map_marker.dart';

// TODO: use proper state management
String selectedItem = "Price";

class LayerMenu extends StatefulWidget {
  const LayerMenu({
    super.key,
    required this.onSelected,
  });

  final Function(String item) onSelected;

  @override
  State<LayerMenu> createState() => _LayerMenuState();
}

class _LayerMenuState extends State<LayerMenu> with SingleTickerProviderStateMixin {
  late AnimationController menuLayerAnimationController;

  @override
  void initState() {
    super.initState();
    menuLayerAnimationController = AnimationController(
      vsync: this,
      duration: 950.ms,
    );
  }

  @override
  void dispose() {
    menuLayerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.layerMenuGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: mapLayerMenuItems
            .map(
              (item) => GestureDetector(
                onTap: () {
                  menuLayerAnimationController.reverse();
                  if (item.title == 'Without any layer') {
                    setState(() {
                      showLayer = false;
                    });
                  } else {
                    setState(() {
                      showLayer = true;
                    });
                  }
                  Future.delayed(300.ms, () {
                    setState(() {
                      selectedItem = item.title;
                      widget.onSelected(item.title);
                    });
                  });
                },
                child: MenuItemTile(item: item),
              ),
            )
            .toList(),
      ),
    )
        .animate(
          controller: menuLayerAnimationController,
        )
        .scale(
          alignment: Alignment.bottomLeft,
        );
  }
}

class MenuItemTile extends StatelessWidget {
  const MenuItemTile({
    super.key,
    required this.item,
  });
  final MenuItemModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          AppIcon(
            icon: item.icon,
            // Temporary
            color: item.title == selectedItem ? AppColors.colorFC9D11 : AppColors.colorA4957E,
          ),
          SizedBox(width: 10.w),
          Text(
            item.title,
            style: AppTypography.label.copyWith(
              color: item.title == selectedItem ? AppColors.colorFC9D11 : AppColors.colorA4957E,
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItemModel {
  final String title;
  final String icon;
  const MenuItemModel({required this.icon, required this.title});
}
