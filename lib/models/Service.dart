import 'package:flutter/material.dart';

class Service {
  final int id;
  final String title, image;
  final Color color;

  Service({this.id, this.title, this.image, this.color});
}

// For demo list of service
List<Service> services = [
  Service(
    id: 4,
    title: "Szybka rekrutacja",
    image: "assets/images/Intreaction_design.png",
    color: const Color(0xFFFFE0E0),
  ),
  Service(
    id: 3,
    title: "Bezpłatne wyszukiwanie pracowników",
    image: "assets/images/ui.png",
    color: const Color(0xFFFFF3DD),
  ),
  Service(
    id: 2,
    title: "Wystawiamy fakturę VAT",
    image: "assets/images/desktop.png",
    color: const Color(0xFFE4FFC7),
  ),
  Service(
    id: 1,
    title: "Dwutygodniowy okres gwarancyjny",
    image: "assets/images/graphic.png",
    color: const Color(0xFFD9FFFC),
  ),
];