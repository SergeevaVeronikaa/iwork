import 'dart:core';
import 'package:flutter/material.dart';
import 'package:iwork/models/Feedback.dart';

import '../../../constants.dart';

class FeedbackCard extends StatefulWidget {
  const FeedbackCard({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  _FeedbackCardState createState() => _FeedbackCardState();
}

class _FeedbackCardState extends State<FeedbackCard> {
  Duration duration = const Duration(milliseconds: 200);
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        fit: BoxFit.fill,
        child: InkWell(
          onTap: () {},
          hoverColor: Colors.transparent,
          onHover: (value) {
            setState(() {
              isHover = value;
            });
          },
          child: AnimatedContainer(
            duration: duration,
            margin: const EdgeInsets.only(top: kDefaultPadding * 3),
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: 410,
            width: 390,
            decoration: BoxDecoration(
              color: feedbacks[widget.index].color,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [if (isHover) kDefaultCardShadow],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.translate(
                  offset: const Offset(0, -55),
                  child: AnimatedContainer(
                    duration: duration,
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 10),
                      boxShadow: [if (!isHover) kDefaultCardShadow],
                      image: DecorationImage(
                        image: AssetImage(feedbacks[widget.index].userPic),
                      ),
                    ),
                  ),
                ),
                Text(
                  feedbacks[widget.index].review,
                  style: const TextStyle(
                    color: kTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: kDefaultPadding * 2),
                // Column(
                //   children: [
                //     // Text(
                //     //   "Ronald Thompson",
                //     //   style: TextStyle(fontWeight: FontWeight.bold),
                //     // )
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
