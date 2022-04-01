import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:iwork/components/section_title.dart';
import 'package:iwork/constants.dart';
import 'package:iwork/user.dart';
import 'package:iwork/user_form_widget.dart';
import 'components/socal_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFE8F0F9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg_img_2.png"),
        ),
      ),
      child: Column(
        children: const [
          SizedBox(height: kDefaultPadding * 2.5),
          SectionTitle(
            title: "Skontaktuj się ze mną",
            subTitle: "Wypełnić formularz",
            color: Color(0xFF07E24A),
          ),
          ContactBox()
        ],
      ),
    );
  }
}

class ContactBox extends StatelessWidget {

  const ContactBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1110),
      margin: const EdgeInsets.only(top: kDefaultPadding * 2),
      padding: const EdgeInsets.all(kDefaultPadding * 3),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SocalCard(
                color: const Color(0xFFD9FFFC),
                iconSrc: "assets/images/telegram_logo.png",
                name: 'Telegram',
                press: () {
                  launch('https://t.me/work_in_poland888');
                },
              ),
              SocalCard(
                color: const Color(0xFFFFE0E0),
                iconSrc: "assets/images/instagram.png",
                name: 'Instagram',
                press: () {
                  launch('https://www.instagram.com/vork_in_poland/');
                },
              ),
              SocalCard(
                color: const Color(0xFFE8F0F9),
                iconSrc: "assets/images/facebook_logo.png",
                name: 'Facebook',
                press: () {
                  launch('https://www.facebook.com/profile.php?id=100078885758857');
                },
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding * 2),
          const ContactForm(),
        ],
      ),
    );
  }
}

class ContactForm extends StatelessWidget {

  const ContactForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          SingleChildScrollView(
            child: UserFormWidget(
              onSavedUser: (user) async {
                final id = await UserSheetsApi.getRowCount() + 1;
                final newUser = user.copy(id: id);

                await UserSheetsApi.insert([newUser.toJson()]);
              },
            ),
          ),
      ]),
    );
  }
}

// Future insertUsers() async {
//   final users = [
//     User(id: 1, name: 'Vitalii', email: 'vitalii@gmail.com', phone: '0505854766', description: 'hello', isBeginner: true),
//     User(id: 2, name: 'Emma', email: 'emma@gmail.com', phone: '0505854766', description: 'hello', isBeginner: true),
//     User(id: 3, name: 'Veronica', email: 'veronica@gmail.com', phone: '0505854766', description: 'hello', isBeginner: true),
//     User(id: 4, name: 'Timoshka', email: 'timoshka@gmail.com', phone: '0505854766', description: 'hello', isBeginner: true),
//     User(id: 5, name: 'Tomeck', email: 'tomeck@gmail.com', phone: '0505854766', description: 'hello', isBeginner: false),
//   ];
//   final jsonUsers = users.map((user) => user.toJson()).toList();
//
//   await UserSheetsApi.insert(jsonUsers);
// }

class UserSheetsApi {
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "gsheets-344508",
  "private_key_id": "f499905e8bb0c5c8c2bfc7808093cd55650e001b",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDHukcq1Of506Nd\nPhE2F9z0p7dWkAcjWQy9IKBYcAMucYtpUBm0liSUFMebY4haXX4QQT6/x0oDa0Nr\n5GNoT0EPPz6rPDxKtZkWbrw4OtCWRK9vsmo5aRMmAg5gaWpjmtLXvSbiLdktHKxt\n9Wf7vHzmOjgPO4gwrVgmlmwn3oCg0oyP6pCrHEM+kOEomC7IXx6ug0KUgqtk5UUV\nHge3/DCABl5moWLEqECst7J03uafD/OdjbJI/Uwfy0+rfGnDImh0A73oT4HDZlEh\nOsma6LQb38NFm1B5mHHYGrDhMlvIDz3otJjr+mkFtm0ubd6iRSbbGt0Xaw3keZgV\nOPq8kLR/AgMBAAECggEARpRx5NVzGqprDx7JZ0O8jeqc0+a21wt3gHhAobAHt8hh\nOziWtOXgDEJhnWxpeYGTdHwSCCSNZ7LmkwCVDn3/YDt50npJVh9hd3dvZTGHl6qz\nEnZKqnoSzbopSXHHKmbCfoG19XS9S/9Xgc4YznF388X8HIntoUIIpi4/D0HGU84k\nEaU3UQ3bRtisDxXVBa75soIMyI0WASIyMKOGvL2S4jVR4EkW3rXYMKqsXHzmxwEA\nKLvwdm21jJ+r2JELvtNv+n/Szlvr3+ltunKhTTxQWAl+BondzxEoY+yZo6EyJpm8\nKml7i6z8uKPlhXnJ8Eof3TSWcSHPOiYgbdAEf7wGLQKBgQDkvMzRFZrbTVNgnJyK\nsYUdgFI4CaVT9+nxOqY+B7TgGoHH34r2c8kjdr3p2QnYShmjnWzH5KMUi5PBRl7R\nfBuFUlgVyqtUdoFxJoxuntMt2zIZBUMY/gSYxnMxhHu7GERr0x/4p5AspMYk8Yal\nnid1+y0SDMUjt0DdOv5B/D5PQwKBgQDfiFWQmjqkP+Cc3R5xTtsHRXDB6ZdnVGVb\ne3mRocXHaj285OmWVsytcMALPTbq7XwSjjOjdhvAoCWqgIqN09gxVQolhNY+Eh+O\n0XaNnMyaDTa7MOBDRyCyFj9K9vcVrqCacvHWZsDQ0vDBdeje5MzH9Pb6KVM5FaJr\ndC51qFW8FQKBgDaP9sd1QOBJHLdyBEFtQRSddH9bha12+L4LQHaRfgrrJ8QWxd4u\nFm+4Nmse06NdYapOthEkr+YJuXAkKiAMW8A8uThRhPb74bqs+Fi22CcbH2Mqhyvi\nBBSxWe8Y7C7gBgo2bWzyA4kysPVFC9pb1IvnI4QnuargXr+m/9mbov1jAoGBALK1\nQYsg8p8b/owKb+swmwV+K76r7QKMQ5hW6ANZLVDXjFI3RNSPwoUrLi4OG5jIkrgW\n/gvCQj/HCTX+HEd1RVNzZHBIeiwXuykoJzriT+UdiVMwqSrAc9BM3v8k4Ldx7C5u\nlQ/PCHorGpXgmXORwnJeUxH+9e0eccKsmPQxx5FdAoGAT7ETgZoUUpr6gpXZpNqa\n5M72X9dd0125/qOVS46RlGHKHEnvBJwAFCisY1TzMRnDSA+dGN8gTR387GXG7CqF\njesguxT7MR1E8yc/e5LHJWisX4eQY0H/x0gGfwSBTBjj/wedfwOeWQ73K9zIbmL5\nl0KVJ+qyBDdF/rxkHEkewEo=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets-573@gsheets-344508.iam.gserviceaccount.com",
  "client_id": "101054537538726821127",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets-573%40gsheets-344508.iam.gserviceaccount.com"
  }
  ''';
  static const _spreadsheetId = '1I7wZ5kTr0ly-rv9LvC2dgS8YdM0dNb9kCTlyxoq7xC4';
  static final _gsheets = GSheets(_credentials);
  static Worksheet _userSheet;

  static Future init() async {
    try{
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'Users');

      final firstRow = UserFields.getFields();
      _userSheet.values.insertRow(1, firstRow);
    } catch(e) {
      // ignore: avoid_print
      print('Init Error: $e');
    }

  }

  static Future<Worksheet> _getWorkSheet(
      Spreadsheet spreadsheet, {
        @required String title,
      })async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
       return spreadsheet.worksheetByTitle(title);

    }
  }

  static Future<int> getRowCount() async {
    if (_userSheet == null) return 0;

    final lastRow = await _userSheet.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }

  static Future<List<User>> getAll() async {
    if (_userSheet == null) return <User>[];

    final users = await _userSheet.values.map.allRows();
    return users == null ? <User>[] : users.map(User.fromJson).toList();
  }

  static Future<User> getById(int id) async {
    if (_userSheet == null) return null;

    final json = await _userSheet.values.map.rowByKey(id, fromColumn: 1);
    return json == null ? null : User.fromJson(json);
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;
    _userSheet.values.map.appendRows(rowList);
  }
}
