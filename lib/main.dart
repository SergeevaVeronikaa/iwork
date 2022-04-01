import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:iwork/constants.dart';
import 'package:iwork/home_screen.dart';
import 'package:iwork/sections/contact/contact_section.dart';
import 'l10n.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetsApi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agencja Pracy Corna Forti Sp.z.o.o',
      theme: ThemeData(
        inputDecorationTheme: kDefaultInputDecorationTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        //AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: const HomeScreen(),
    );
  }
}
