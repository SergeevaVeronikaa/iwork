import 'package:flutter/material.dart';
import 'package:iwork/components/default_button.dart';
import 'package:iwork/components/my_outline_button.dart';
import 'package:iwork/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/about_section_text.dart';
import 'components/about_text_with_sign.dart';
import 'components/experience_card.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: kDefaultPadding * 2.5),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AboutTextWithSign(),
                Expanded(
                  child: Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AboutSectionText(
                        text:
                        " Praca dla Ukraińców w Polsce z Agencją\n Pracy Corna Forti Sp.z.o.o. jest w 100%\n legalna. Stale nadzorujemy wszystkie\n aspekty prawne, organizacyjne i jakościowe\n związane z obsługą Twojego zlecenia,\n przeprowadzamy szybką rekrutację,\n bezpłatne poszukiwania pracowników.\n Płatność jednorazowa za każdego\n wyznaczonego pracownika!",
                      ),
                    ),
                  ),
                ),
                Flexible(
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: ExperienceCard(numOfExp: "08"))),
                Expanded(
                  child: Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AboutSectionText(
                        text:
                        " Zapewnimy niezbędne dokumenty potrzebne\n do legalnego zatrudnienia cudzoziemców.\n Prowadzimy selekcje pracowników\n dopasowanych do indywidualnych\n zapotrzebowań Klienta. Świadczymy swoje\n usługi na terenie całej Polski. W krótkim\n czasie skierujemy do Państwa firmy\n potrzebną ilość pracowników (istnieje\n możliwość natychmiastowej rekrutacji).",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: kDefaultPadding * 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: MyOutlineButton(
                      imageSrc: "assets/images/hand.png",
                      text: "Napisz do mnie!",
                      press: () {
                        customLaunch('mailto:osierhieieva@gmail.com?subject=Szukam%20pracowników!&body=ВCześć!%20');
                      },
                    ),
                  ),
                ),
                const SizedBox(width: kDefaultPadding * 1),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: DefaultButton(
                      imageSrc: "assets/images/download.png",
                      text: "Pobierz zamówienie",
                      press: () {
                        launch('https://docs.google.com/document/d/1X4J2WWGQ-ElNLbwsyl7-oanWGoVXX5k3/edit?usp=sharing&ouid=109872749257380034220&rtpof=true&sd=true');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    }  else {
      print('Could not launch $command');
    }
  }
}


