import 'package:flutter/material.dart';
import 'package:iwork/components/section_title.dart';
import 'package:iwork/constants.dart';
import 'package:iwork/models/RecentWork.dart';

import 'components/recent_work_card.dart';

class RecentWorkSection extends StatelessWidget {
  const RecentWorkSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: kDefaultPadding * 2.5),
      width: double.infinity,
      // just for demo
      // height: 600,
      decoration: BoxDecoration(
        color: const Color(0xFFF7E8FF).withOpacity(0.3),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/recent_work_bg.png"),
        ),
      ),
      child: Column(
        children: [
          // Transform.translate(
          //   offset: Offset(0, -80),
          //   child: HireMeCard(),
          // ),
          const SectionTitle(
            title: "Вакансії",
            subTitle: "Безкоштовні актуальні вакансії",
            color: Color(0xFFFFB100),
          ),
          const SizedBox(height: kDefaultPadding * 1.5),
          SizedBox(
            width: 1110,
            child: Wrap(
              spacing: kDefaultPadding,
              runSpacing: kDefaultPadding * 2,
              children: List.generate(
                recentWorks.length,
                    (index) => RecentWorkCard(index: index, press: () {}),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding * 5),
        ],
      ),
    );
  }
}