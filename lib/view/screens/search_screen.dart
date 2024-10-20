import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:moniepoint_challenge/services/hepers/constants.dart';
import 'package:moniepoint_challenge/view/styles/colors.dart';
import 'package:moniepoint_challenge/view/styles/icons.dart';
import 'package:moniepoint_challenge/view/styles/typography.dart';
import 'package:moniepoint_challenge/view/widgets/app_icon.dart';
import 'package:moniepoint_challenge/view/widgets/map_layer_menu.dart';
import 'package:moniepoint_challenge/view/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController(text: 'Saint Petersberg');
  final FocusNode searchFocus = FocusNode();
  final MapController mapController = MapController();
  bool showMenu = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => searchFocus.unfocus(),
      child: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              onTap: (_, __) => searchFocus.unfocus(),
              onMapReady: () {
                mapController.fitCamera(
                  const CameraFit.coordinates(
                    coordinates: [
                      LatLng(59.932, 30.348),
                      LatLng(59.930, 30.345),
                      LatLng(59.930, 30.353),
                      LatLng(59.925, 30.340),
                      LatLng(59.925, 30.350),
                      LatLng(59.923, 30.352),
                    ],
                    maxZoom: 14.7,
                  ),
                );
              },
              initialCenter: const LatLng(59.927, 30.350),
              initialZoom: 14.8,
              backgroundColor: AppColors.color232220,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
                tileBuilder: _darkModeTileBuilder,
              ),
              MarkerLayer(markers: List.from(tempMarkers)),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w).copyWith(top: 16.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => searchFocus.requestFocus(),
                        child: Container(
                          height: 40.h,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.r),
                            color: AppColors.colorWhite,
                          ),
                          child: Row(
                            children: [
                              AppIcon(
                                icon: AppSvgIcons.searchOutline,
                                color: AppColors.colorA4957E,
                                size: 14.w,
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: TextField(
                                  controller: searchController,
                                  focusNode: searchFocus,
                                  style: AppTypography.label,
                                  decoration: const InputDecoration.collapsed(hintText: 'Search...'),
                                ),
                              ),
                            ],
                          ),
                        ).animate().scale(
                              duration: 600.ms,
                            ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.colorWhite,
                      ),
                      child: Center(
                        child: AppIcon(
                          icon: AppSvgIcons.settings,
                          color: AppColors.colorA4957E,
                          size: 14.w,
                        ),
                      ),
                    ).animate().scale(
                          duration: 600.ms,
                        ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 32.w).copyWith(bottom: 100.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showMenu)
                    LayerMenu(
                      onSelected: (item) {
                        showMenu = false;
                        setState(() {});
                      },
                    ),
                  CircularMapButton(
                    icon: AppSvgIcons.wallet,
                    onTap: () {
                      setState(() {
                        showMenu = !showMenu;
                      });
                    },
                  ),
                  CircularMapButton(
                    icon: AppSvgIcons.mapArrow,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 32.w).copyWith(bottom: 100.h),
              child: MapButton(
                onTap: () {},
                text: 'List of variants',
                icon: AppSvgIcons.list,
              ),
            ),
          ),
        ],
      ).animate().fadeIn(duration: 600.ms),
    );
  }
}

Widget _darkModeTileBuilder(
  BuildContext context,
  Widget tileWidget,
  TileImage tile,
) {
  return ColorFiltered(
    colorFilter: const ColorFilter.matrix(
      <double>[
        -0.2126,
        -0.7152,
        -0.0722,
        0,
        220,
        -0.2126,
        -0.7152,
        -0.0722,
        0,
        220,
        -0.2126,
        -0.7152,
        -0.0722,
        0,
        220,
        0,
        0,
        0,
        1,
        0,
      ],
    ),
    child: tileWidget,
  );
}
