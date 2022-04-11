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
      padding: const EdgeInsets.only(top: kDefaultPadding * 3.5),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AboutTextWithSign(),
                Expanded(
                  child: AboutSectionText(
                    text:
                    "Praca dla Ukraińców w Polsce z Agencją Pracy Corna Forti Sp.z.o.o. jest w 100% legalna. Stale nadzorujemy wszystkie aspekty prawne, organizacyjne i jakościowe związane z obsługą Twojego zlecenia, przeprowadzamy szybką rekrutację, bezpłatne poszukiwania pracowników. Płatność jednorazowa za każdego wyznaczonego pracownika!",
                  ),
                ),
                ExperienceCard(numOfExp: "08"),
                Expanded(
                  child: AboutSectionText(
                    text:
                    "Zapewnimy niezbędne dokumenty potrzebne do legalnego zatrudnienia cudzoziemców. Prowadzimy selekcje pracowników dopasowanych do indywidualnych zapotrzebowań Klienta. Świadczymy swoje usługi na terenie całej Polski. W krótkim czasie skierujemy do Państwa firmy potrzebną ilość pracowników (istnieje możliwość natychmiastowej rekrutacji).",
                  ),
                ),
              ],
            ),
            const SizedBox(height: kDefaultPadding * 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyOutlineButton(
                  imageSrc: "assets/images/hand.png",
                  text: "Napisz do mnie!",
                  press: () {
                    customLaunch('mailto:osierhieieva@gmail.com?subject=Szukam%20pracowników!&body=ВCześć!%20');
                  },
                ),
                const SizedBox(width: kDefaultPadding * 1),
                DefaultButton(
                  imageSrc: "assets/images/download.png",
                  text: "Pobierz zamówienie",
                  press: () {
                    launch('https://docs.google.com/document/d/1X4J2WWGQ-ElNLbwsyl7-oanWGoVXX5k3/edit?usp=sharing&ouid=109872749257380034220&rtpof=true&sd=true');
                  },
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


