class RecentWork {
  final String image, category, title;
  final int id;

  final Function press;

  RecentWork({this.id, this.image, this.category, this.title, this.press});
}

// Demo List of my works
List<RecentWork> recentWorks = [
  RecentWork(
    id: 1,
    title: "Догляд за саджанцями у м. Лешно",
    category: "Польові роботи",
    image: "assets/images/work_1.png",
  ),
  RecentWork(
    id: 2,
    title: "New & Fresh Looking Portfolio indeed at the end",
    category: "Ще щось там",
    image: "assets/images/work_2.png",
  ),
  RecentWork(
    id: 3,
    title: "Виробництво туалетного паперу",
    category: "Заводи та фабрики",
    image: "assets/images/work_3.png",
  ),
  RecentWork(
    id: 4,
    title: "New & Fresh Looking Portfolio indeed at the end",
    category: "Будівельні роботи",
    image: "assets/images/work_4.png",
    press: () {
    },
  ),
];