import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';
import '../about/components/about_section_text.dart';

class InformationSection extends StatelessWidget {
  const InformationSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      //constraints: BoxConstraints(maxWidth: 1110),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFE8F0F9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg_img_2.png"),
        ),
      ),
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(200.0, 2.0, 3.0, 4.0),
                    child: GestureDetector(
                      onTap: (){
                        launch('https://www.instagram.com/_v_i_a_r_i_k_a_/?hl=ru');
                      },
                      child: const AboutSectionText(
                        text:
                        "DEVELOPED BY: \nInstagram: _v_i_a_r_i_k_a_ \nE-mail: novoinvestn@gmail.com \n+48 502 592 014\n+38 050 585 47 66",
                      ),
                    ),
                  ),
                ),
                FittedBox(
                  child: GestureDetector(
                    onTap: (){
                      launch('https://github.com/abuanwar072');
                    },
                    child: const AboutSectionText(
                      text:
                      "DESIGNED BY: \nTaken from the GitHub resource: \nAbu Anwar",
                    ),
                  ),
                ),
              ],
            ),
            //SizedBox(height: kDefaultPadding),
          ],
        ),
      ),
    );
  }
}