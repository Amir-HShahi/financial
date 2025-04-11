import 'package:hive/hive.dart';

abstract class HiveDatabase {
  void initialize();

  Future<Box> getCategoriesBox();

  Future<Box> getTransactionsBox();

  void deleteAllFromDisk();
}
