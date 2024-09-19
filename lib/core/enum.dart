import 'package:flutter/material.dart';

enum TaskCategories {
  education(Icons.school, Colors.blueGrey),
  health(Icons.favorite, Colors.orange),
  home(Icons.home, Colors.green),
  others(Icons.calendar_month, Colors.purple),
  personal(Icons.person, Colors.lightBlue),
  shopping(Icons.shopping_bag, Colors.pink),
  social(Icons.people, Colors.brown),
  travel(Icons.flight, Colors.deepOrange),
  work(Icons.work, Colors.amber);

  final IconData icon;
  final Color color;

  const TaskCategories(
    this.icon,
    this.color,
  );
}

TaskCategories getCategoryByString(String key) {
  switch (key) {
    case "education":
      return TaskCategories.education;
    case "health":
      return TaskCategories.health;
    case "home":
      return TaskCategories.home;
    case "personal":
      return TaskCategories.personal;
    case "shopping":
      return TaskCategories.shopping;
    case "social":
      return TaskCategories.social;
    case "travel":
      return TaskCategories.travel;
    case "work":
      return TaskCategories.work;
    default:
      return TaskCategories.others;
  }
}
