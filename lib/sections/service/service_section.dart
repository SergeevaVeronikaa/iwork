import 'package:flutter/material.dart';
import 'package:iwork/components/section_title.dart';
import 'package:iwork/constants.dart';
import 'package:iwork/models/Service.dart';

import 'components/service_card.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          const SectionTitle(
            color: Color(0xFFFF0000),
            title: "Oferujemy",
            subTitle: "Nasze zalety",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                services.length, (index) => Expanded(
                child: ServiceCard(index: index))),
          )
        ],
      ),
    );
  }
}