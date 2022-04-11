import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwork/components/hireme_card.dart';
import 'package:iwork/constants.dart';
import 'components/logo_blur_box.dart';
import 'components/person_pic.dart';

class TopSection extends StatelessWidget {
  const TopSection ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      constraints: const BoxConstraints(maxHeight: 550, minHeight: 420),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/background.png"),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: kDefaultPadding),
        width: 1110,
        child: Stack(
          children: [
            LogoAndBlurBox(size: size),
            const Positioned(
              bottom: 0,
              right: 0,
              child: PersonPic(),
            ),
            Positioned.fill(
              bottom: 0,
              child: Column(
                children: [
                  Transform.translate(
                      offset: const Offset(0, 470),
                      child: const Flexible(
                          child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: HireMeCard()))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}