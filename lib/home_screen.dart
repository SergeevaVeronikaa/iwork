// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:iwork/constants.dart';
import 'package:iwork/sections/about/aboutSection.dart';
import 'package:iwork/sections/contact/contact_section.dart';
import 'package:iwork/sections/feedback/feedback_section.dart';
import 'package:iwork/sections/informationSection/information_section.dart';
//import 'package:iwork/sections/recent_work/recent_work_section.dart';
import 'package:iwork/sections/service/service_section.dart';
import 'package:iwork/sections/topSection/top_section.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          try {
            dynamic conversationObject = {
              'appId': '5e56ae6c14c76006f9170ebf5ecb826b' // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
            };
            dynamic result = await KommunicateFlutterPlugin.buildConversation(conversationObject);
            print("Conversation builder success : " + result.toString());
          } on Exception catch (e) {
            print("Conversation builder error occurred : " + e.toString());
          }
        },
        label: const Text(''),
        //icon: const Icon(Icons.message),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            TopSection(),
            SizedBox(height: kDefaultPadding * 2),
            AboutSection(),
            ServiceSection(),
            //RecentWorkSection(),
            FeedbackSection(),
            SizedBox(height: kDefaultPadding),
            ContactSection(),
            InformationSection(),
          ],
        ),
      ),
    );
  }
}

