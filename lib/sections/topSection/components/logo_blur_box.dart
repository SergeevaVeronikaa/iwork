
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'glass_content.dart';

class LogoAndBlurBox extends StatelessWidget {
  const LogoAndBlurBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;


  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        // ignore: deprecated_member_use
        TypewriterAnimatedTextKit(
        pause: const Duration(milliseconds:  1200),
            text: const ["Telefon: +48 507 830 446"],
            textStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white),
            displayFullTextOnTap: true,
            stopPauseOnTap: true
    ),
        const Spacer(),
        GlassContent(size: size),
        const Spacer(flex: 3),
      ],
    );
  }
}