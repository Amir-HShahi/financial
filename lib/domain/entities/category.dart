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
  final int id;
  final Categories title;
  final List<int> transactionsId;
  double budget;
  double availableAmount;

  Category(
    this.id,
    this.title,
    this.budget,
    this.availableAmount,
    this.transactionsId,
  );
}
