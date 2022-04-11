import 'package:flutter/material.dart';

class PersonPic extends StatelessWidget {
  const PersonPic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(
          maxWidth: 490,
          maxHeight: 530,
      ),
      child: Image.asset("assets/images/person2.png",
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
