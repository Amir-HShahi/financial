enum Categories {
  health,
  entertainment,
  food,
  clothing,
  transport,
  housing,
  gifts,
  education,
  miscellaneous,
  savings,
}

abstract class Category {
  int id;
  String title;
  double budget;
  double availableAmount;

  Category(this.id, this.title, this.budget, this.availableAmount);
}
