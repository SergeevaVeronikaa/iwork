import 'package:flutter/material.dart';
import 'package:iwork/models/RecentWork.dart';
import '../../../../constants.dart';
import '../../../constants.dart';

class RecentWorkCard extends StatefulWidget {
  // just press "Command + ."
  const RecentWorkCard({
    Key key,
    this.index,
    this.press,
  }) : super(key: key);

  final int index;
  final Function press;

  @override
  _RecentWorkCardState createState() => _RecentWorkCardState();
}

class _RecentWorkCardState extends State<RecentWorkCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 320,
        width: 540,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover) kDefaultCardShadow],
        ),
        child: Row(
          children: [
            Image.asset(recentWorks[widget.index].image),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(recentWorks[widget.index].category.toUpperCase()),
                    const SizedBox(height: kDefaultPadding / 1.5),
                    Text(
                      recentWorks[widget.index].title,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(height: 1.5),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    //way to other screen
                    GestureDetector(
                      onTap: (){
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => MBContactForm ()));
                      },
                      child: const Text(
                        "Переглянути деталі",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}