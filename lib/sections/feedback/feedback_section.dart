import 'package:flutter/material.dart';
import 'package:iwork/components/section_title.dart';
import 'package:iwork/constants.dart';
import 'package:iwork/models/Feedback.dart';

import 'components/feedback_card.dart';

class FeedbackSection extends StatelessWidget {
  const FeedbackSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2.5),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          const FittedBox(
            fit: BoxFit.scaleDown,
            child: SectionTitle(
              title: "Feedback",
              subTitle: "Przedstawiciele Agencji",
              color: Color(0xFF00B1FF),
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              List.generate(
                feedbacks.length,
                    (index) => FeedbackCard(index: index),
              ),
            ),
        ],
      ),
    );
  }
}
