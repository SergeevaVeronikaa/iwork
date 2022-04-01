import 'package:flutter/material.dart';
import 'package:iwork/user.dart';
import 'components/default_button.dart';
import 'constants.dart';

class UserFormWidget extends StatefulWidget {
  final User user;
  final ValueChanged<User> onSavedUser;

  const UserFormWidget({
    Key key,
    Wrap child, this.onSavedUser, this.user
  }) : super(key: key);

  @override
  _UserFormWidgetState createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {
  final String font = "SanFrancisco";
  final double size = 20.0;
  final double height = 45.0;
  final formKey = GlobalKey<FormState>();
  TextEditingController controllerName;
  TextEditingController controllerEmail;
  TextEditingController controllerPhone;
  TextEditingController controllerDescription;
  bool isBeginner;

  @override
  void initState(){
    super.initState();

    initUser();
  }

  @override
  void didUpdateWidget(covariant UserFormWidget oldWidget){
    super.didUpdateWidget(oldWidget);

    initUser();
  }

  void initUser() {
    final name = widget.user == null ? '' : widget.user.name;
    final email = widget.user == null ? '' : widget.user.email;
    final phone = widget.user == null ? '' : widget.user.phone;
    final description = widget.user == null ? '' : widget.user.description;
    final isBeginner = widget.user == null ? true : widget.user.isBeginner;

    setState(() {
      controllerName = TextEditingController(text: name);
      controllerEmail = TextEditingController(text: email);
      controllerPhone = TextEditingController(text: phone);
      controllerDescription = TextEditingController(text: description);
      this.isBeginner = true;
    });
  }

  // void messageButton(BuildContext context){
  //   var alertDialog = AlertDialog(
  //     title: Text('Message sent successfully!'),
  //     content: Text('Our operator will contact you shortly'),
  //   );
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext) => alertDialog
  //   );
  // }

  @override
  Widget build(BuildContext context) => Form(
    key: formKey,
    child: Column(
      mainAxisSize: MainAxisSize.min,
        children: [
          buildName(),
          const SizedBox(height: 16),
          buildEmail(),
          const SizedBox(height: 16),
          buildPhone(),
          const SizedBox(height: 16),
          buildDescription(),
          const SizedBox(),
          buildFlutterBeginner(),
          buildSubmit(),
          const SizedBox(),
        ],
    ),
  );

  Widget buildName() => TextFormField(
    controller: controllerName,
    decoration: const InputDecoration(
      labelText: 'Іmię',
      border: OutlineInputBorder(),
    ),
    validator: (value) =>
        value != null && value.isEmpty ? 'Wprowadź imię' : null,
  );

  Widget buildEmail() => TextFormField(
    controller: controllerEmail,
    decoration: const InputDecoration(
      labelText: 'E-mail',
      border: OutlineInputBorder(),
    ),
    validator: (value) =>
    value != null && !value.contains('@') ? 'Wprowadź e-mail' : null,
  );

  Widget buildPhone() => TextFormField(
    controller: controllerPhone,
    keyboardType: TextInputType.number,
    decoration: const InputDecoration(
      labelText: 'Telefon',
      border: OutlineInputBorder(),
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Wprowadź numer telefonu' : null,
  );

  Widget buildDescription() => TextFormField(
    maxLines: 8,
    controller: controllerDescription,
    decoration: const InputDecoration(
      labelText: 'Opis',
      border: OutlineInputBorder(),
    ),
    maxLength: 800,
  );

  Widget buildFlutterBeginner() => SwitchListTile(
    contentPadding: EdgeInsets.zero,
    controlAffinity: ListTileControlAffinity.leading,
    value: isBeginner,
    title: const Text('Potwierdzam, że zapoznałem się z informacjami o ochronie danych osobowych. Wyrażam zgodę na przetwarzanie danych Agencje Рracy Corna Forti Sp.z.o.o. zgodnie z ustawą o ochronie danych osobowych w związku z realizacją zgłoszenia'),
    onChanged: (value) => setState(() => isBeginner = value),
  );

  Widget buildSubmit() => SizedBox(
    child: Center(
      child: FittedBox(

        alignment: Alignment.topCenter,
        child: DefaultButton(
          text: 'Prześlij formularz!',
          imageSrc: "assets/images/contact_icon.png",
          press: (){
              final form = formKey.currentState;
              final isValid = form.validate();

              if (isValid) {
                final user = User(
                  name: controllerName.text,
                  email: controllerEmail.text,
                  phone: controllerPhone.text,
                  description: controllerDescription.text,
                  isBeginner: isBeginner, id: null,
                );
                widget.onSavedUser(user);

                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.of(context).pop(true);
                      });
                      return AlertDialog(
                        title: Center(
                          child: Text('Skutecznie!',
                              style: TextStyle(
                                  fontFamily: font,
                                  fontSize: size,
                                  fontWeight: FontWeight.w100)),
                        ),
                        content: const Text('Nasz operator skontaktuje się z Tobą wkrótce'),
                      );
                    });
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.of(context).pop(true);
                      });
                      return AlertDialog(
                        title: Center(
                          child: Text('Ups...',
                              style: TextStyle(
                                  fontFamily: font,
                                  fontSize: size,
                                  fontWeight: FontWeight.w100)),
                        ),
                        content: const Text('Wypełnij wszystkie linie'),
                      );
                    });
              }
          },
        ),
      ),
    ),
  );
}