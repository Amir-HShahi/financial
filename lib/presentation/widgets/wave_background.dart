import 'package:flutter/cupertino.dart';

import '../../data/utils/scale.dart';

class WaveBackground extends StatelessWidget {
  final Widget child;
  const WaveBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Image(
                matchTextDirection: true,
                image: AssetImage('assets/images/wave_background_header.png'),
                height: Scale.height(210),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Image(
                matchTextDirection: true,
                image: AssetImage('assets/images/wave_background_footer.png'),
                height: Scale.height(120),
              ),
            ),
          ],
        ),
        child,
      ],
    );
  }
}
