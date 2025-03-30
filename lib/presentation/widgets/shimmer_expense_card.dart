import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/utils/design_colors.dart';
import '../../data/utils/scale.dart';

class ShimmerExpenseCard extends StatelessWidget {
  const ShimmerExpenseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Scale.height(16))),
        boxShadow: [
          BoxShadow(
            color: DesignColors.deepDarkBlue.withValues(alpha: 0.01),
            offset: Offset(0, Scale.height(2)),
            spreadRadius: Scale.height(1),
            blurRadius: Scale.height(8),
          ),
        ],
      ),
      child: Container(
        width: Scale.width(345),
        height: Scale.height(66),
        padding: EdgeInsets.symmetric(
          horizontal: Scale.width(16),
          vertical: Scale.height(16),
        ),
        decoration: BoxDecoration(
          color: DesignColors.white,
          borderRadius: BorderRadius.all(Radius.circular(Scale.height(16))),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxHeight = constraints.maxHeight;
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Leading icon placeholder
                  Container(
                    height: maxHeight,
                    width: maxHeight,
                    margin: EdgeInsetsDirectional.only(end: Scale.width(8)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Scale.height(10)),
                      ),
                    ),
                  ),

                  // Title and category placeholders
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Title placeholder
                      Container(
                        width: Scale.width(100),
                        height: 0.45 * maxHeight,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Scale.height(4)),
                        ),
                      ), // Category placeholder
                      Container(
                        width: Scale.width(80),
                        height: 0.4 * maxHeight,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Scale.height(4)),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Date and amount placeholders
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Date placeholder
                      Container(
                        width: Scale.width(70),
                        height: 0.35 * maxHeight,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Scale.height(4)),
                        ),
                      ), // Amount placeholder
                      Container(
                        width: Scale.width(60),
                        height: 0.41 * maxHeight,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Scale.height(4)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
