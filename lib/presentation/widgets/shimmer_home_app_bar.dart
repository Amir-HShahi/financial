import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/utils/scale.dart';

/// A shimmer version of the HomeAppBar to display during loading states.
///
/// This widget maintains the same dimensions and layout as the original
/// HomeAppBar but displays shimmering placeholders instead of actual content.
class ShimmerHomeAppBar extends PreferredSize {
  ShimmerHomeAppBar({
    super.key,
  }) : super(
    preferredSize: Size(double.infinity, Scale.height(111)),
    child: SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          Scale.width(24),
          Scale.height(32),
          Scale.width(24),
          Scale.height(16),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Shimmer for greeting text
                  Container(
                    width: Scale.width(200),
                    height: Scale.height(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Scale.height(4)),
                    ),
                  ),
                  SizedBox(height: Scale.height(8)),
                  // Shimmer for "have a nice day" text
                  Container(
                    width: Scale.width(150),
                    height: Scale.height(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Scale.height(4)),
                    ),
                  ),
                ],
              ),
              // Shimmer for profile image
              Container(
                width: Scale.height(64),
                height: Scale.height(64),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}