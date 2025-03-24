import 'package:financial/presentation/widgets/profile_image_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../core/utils/design_colors.dart';
import '../../core/utils/scale.dart';

/// ### Parameters:
/// - [sayHello]: A required string to represent the main greeting text.
/// - [haveANiceDay]: A required string for the secondary message under the greeting.
/// - [key]: An optional widget key for state management.
///
/// ### Example Usage:
/// ```
/// CustomizedAppBar(
///   sayHello: "Hello, John",
///   haveANiceDay: "Have a nice day!",
/// )
/// ```
///
class HomeAppBar extends PreferredSize {
  /// The greeting text to be displayed at the top.
  final String sayHello;

  /// A secondary message to inspire or greet the user.
  final String haveANiceDay;

  HomeAppBar({
    super.key,
    required this.sayHello,
    required this.haveANiceDay,
  }) : super(
         preferredSize: Size(double.infinity, Scale.height(111)),
         // Sets app bar's fixed height.
         child: SafeArea(
           child: Padding(
             padding: EdgeInsets.fromLTRB(
               Scale.width(24), // Left padding
               Scale.height(32), // Top padding
               Scale.width(24), // Right padding
               Scale.height(16), // Bottom padding
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                       sayHello,
                       style: TextStyle(
                         color: DesignColors.deepDarkBlue,
                         fontSize: Scale.height(24),
                         fontWeight: FontWeight.w700,
                       ),
                     ),
                     Text(
                       haveANiceDay,
                       style: TextStyle(
                         color: DesignColors.deepDarkBlue.withAlpha(153),
                         fontSize: Scale.height(14),
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                   ],
                 ),
                 ProfileImageWidget(),
               ],
             ),
           ),
         ),
       );
}
