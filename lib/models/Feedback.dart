import 'package:flutter/material.dart';

class Feedback {
  final String name, review, userPic;
  final int id;
  final Color color;

  Feedback({this.name, this.review, this.userPic, this.id, this.color});
}
// List of demo feedbacks
List<Feedback> feedbacks = [
  Feedback(
    id: 1,
    name: "Олена",
    review: review_1,
    userPic: "assets/images/woman.jpg",
    color: const Color(0xFFFFF3DD),
  ),
  Feedback(
    id: 2,
    name: "Олексій",
    review: review_2,
    userPic: "assets/images/man.jpg",
    color: const Color(0xFFD9FFFC),
  ),
  // Feedback(
  //   id: 3,
  //   name: "Вероніка",
  //   review: review_3,
  //   userPic: "assets/images/veronica.png",
  //   color: Color(0xFFFFE0E0),
  // ),
];

String review_1 =
    'Będę Twoim osobistym doradcą w zakresie doboru wykwalifikowanych pracowników. Doradzam w zakresie legalizacji pracowników.\n\n osierhieieva@gmail.com\n +48507830446\n\n                                              Olena';
String review_2 =
    'Udzielam wsparcia w procedurze uzyskania aktualnej wizy dla przyszłego pracownika, zezwolenia na pobyt oraz legalnej pracy w Polsce.\n\n osierhieieva@gmail.com\n +48532992442\n\n                                             Oleksii';
String review_3 =
    'Я підберу для вас вакансію від перевірених працедавців Польщі. Проконсультую з питань оформлення документів\n\n osierhieieva@gmail.com\n +48500735074\n\n                           Вероніка';