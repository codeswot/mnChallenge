import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:moniepoint_challenge/view/screens/screens.dart';
import 'package:moniepoint_challenge/view/styles/colors.dart';
import 'package:moniepoint_challenge/view/styles/icons.dart';
import 'package:moniepoint_challenge/view/widgets/app_icon.dart';
import 'package:moniepoint_challenge/view/widgets/map_layer_menu.dart';
import 'package:moniepoint_challenge/view/widgets/map_marker.dart';
import 'package:moniepoint_challenge/view/widgets/widgets.dart';

const List<CatalogModel> catalogItems = [
  CatalogModel(
      imageUrl: 'https://images.pexels.com/photos/1643383/pexels-photo-1643383.jpeg', title: 'Gladkova St., 25'),
  CatalogModel(
      imageUrl:
          'https://images.pexels.com/photos/20337873/pexels-photo-20337873/free-photo-of-view-of-a-corner-of-a-room-with-a-dresser-and-armchair.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      title: 'Maidover Rd., 23'),
  CatalogModel(
      imageUrl:
          'https://images.pexels.com/photos/1457844/pexels-photo-1457844.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      title: 'Newark, 25'),
  CatalogModel(
      imageUrl:
          'https://images.pexels.com/photos/271816/pexels-photo-271816.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      title: 'Gobarau St., 43B'),
  CatalogModel(
    imageUrl:
        'https://images.pexels.com/photos/20337842/pexels-photo-20337842/free-photo-of-a-soft-light-colored-sofa-and-a-wooden-chair-in-a-modern-living-room.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    title: 'Dikko Rd., U/Rimi',
  ),
];

final pageScreens = [
  const SearchScreen(),
  Center(
    child: AppIcon(
      icon: AppSvgIcons.chat,
      color: AppColors.colorFC9D11,
      size: 40.w,
    ),
  ),
  const HomeScreen(),
  Center(
    child: AppIcon(
      icon: AppSvgIcons.heart,
      color: AppColors.colorFC9D11,
      size: 40.w,
    ),
  ),
  Center(
    child: CircleAvatar(
      radius: 50.r,
      child: Center(
        child: AppIcon(
          icon: AppSvgIcons.user,
          color: AppColors.colorWhite,
          size: 40.w,
        ),
      ),
    ),
  ),
];
final tempMarkers = [
  buildMarker(
    position: const LatLng(59.932, 30.348), // Top marker
    text: '10,3 mn P',
  ),
  buildMarker(
    position: const LatLng(59.930, 30.345), // Slightly below and aligned
    text: '11 mn P',
  ),
  buildMarker(
    position: const LatLng(59.930, 30.353), // Right side marker
    text: '7,8 mn P',
  ),
  buildMarker(
    position: const LatLng(59.925, 30.340), // Bottom-left marker
    text: '13,3 mn P',
  ),
  buildMarker(
    position: const LatLng(59.925, 30.350), // Center-right
    text: '8,5 mn P',
  ),
  buildMarker(
    position: const LatLng(59.923, 30.352), // Bottom-right
    text: '6,95 mn P',
  ),
];

final mapLayerMenuItems = [
  const MenuItemModel(
    icon: AppSvgIcons.secure,
    title: 'Cosy areas',
  ),
  const MenuItemModel(
    icon: AppSvgIcons.wallet,
    title: 'Price',
  ),
  const MenuItemModel(
    icon: AppSvgIcons.cart,
    title: 'Infrastructure',
  ),
  const MenuItemModel(
    icon: AppSvgIcons.layer,
    title: 'Without any layer',
  ),
];
