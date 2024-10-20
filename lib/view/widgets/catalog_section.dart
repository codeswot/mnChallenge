import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:moniepoint_challenge/view/styles/styles.dart';
import 'package:shimmer/shimmer.dart';

class AppCatalogSection extends StatelessWidget {
  final List<CatalogModel> items;

  const AppCatalogSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.1.sh,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.cataloColorsGradient,
          )),
      child: Column(
        children: [
          CatalogWidget(item: items.first, index: 0),
          SizedBox(height: 8.w),
          Expanded(
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8.w,
              crossAxisSpacing: 8.w,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length - 1,
              itemBuilder: (context, index) {
                final paddedIndex = index + 1;
                return CatalogWidget(item: items[paddedIndex], index: paddedIndex);
              },
            ),
          ),
        ],
      ),
    ).animate().slideY(
          begin: 1,
          end: 0,
          delay: 400.ms,
          duration: 900.ms,
        );
  }
}

class CatalogWidget extends StatelessWidget {
  const CatalogWidget({
    super.key,
    required this.item,
    required this.index,
  });

  final CatalogModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: index == 0
              ? 150.h
              : index == 1
                  ? 300.h
                  : 150.h,
          decoration: BoxDecoration(
            // color: AppColors.colorFC9D11.withOpacity(0.1),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: CachedNetworkImage(
                    imageUrl: item.imageUrl,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(
                      width: 50.w,
                      height: 50.h,
                      child: Shimmer.fromColors(
                        baseColor: AppColors.colorA4957E,
                        highlightColor: AppColors.colorFC9D11,
                        child: const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(child: Icon(Icons.broken_image)),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 1.sw,
                    height: index == 0 ? 40.h : 30.h,
                    margin: EdgeInsets.symmetric(horizontal: 16.w).copyWith(bottom: 16.h),
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24.r),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.colorWhite.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                            ),
                          ),
                        ).animate().scaleX(
                              delay: 1800.ms,
                              duration: 900.ms,
                              alignment: Alignment.centerLeft,
                            ),
                        Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Spacer(),
                              Flexible(
                                flex: 5,
                                child: Text(
                                  item.title,
                                  style: AppTypography.label.copyWith(
                                    color: AppColors.color232220,
                                    fontSize: 12.sp,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                )
                                    .animate(
                                      delay: 2800.ms,
                                    )
                                    .fade(
                                      duration: 900.ms,
                                    ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(index == 0 ? 10.w : 5.w),
                                  decoration: const BoxDecoration(
                                    color: AppColors.colorWhite,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.chevron_right,
                                    color: AppColors.colorA4957E,
                                  ),
                                ),
                              )
                                  .animate()
                                  .scale(
                                    delay: 1300.ms,
                                    duration: 950.ms,
                                  )
                                  .slideX(
                                    delay: 1500.ms,
                                    duration: 1200.ms,
                                    begin: -10,
                                    end: 0,
                                  )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class CatalogModel {
  final String title;
  final String imageUrl;
  const CatalogModel({required this.imageUrl, required this.title});
}
