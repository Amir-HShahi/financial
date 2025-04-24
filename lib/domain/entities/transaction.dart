enum TransactionType { income, expense }

abstract class Transaction {
  final int id;
  final String title;
  final TransactionType transactionType;
  final int categoryId;
  final DateTime date;
  final int amount;

  Transaction(
    this.id,
    this.title,
    this.transactionType,
    this.categoryId,
    this.date,
    this.amount,
  );
}
