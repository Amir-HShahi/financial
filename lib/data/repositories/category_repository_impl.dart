import 'package:financial/data/data_sources/local/hive_database_impl.dart';
import 'package:financial/data/models/category_model.dart';
import 'package:financial/domain/data_sources/local/hive_database.dart';
import 'package:financial/domain/repositories/categoty_repository.dart';
import 'package:hive/hive.dart';

class CategoryRepositoryImpl implements CategoryRepository{
  final HiveDatabaseImpl hive;
  late final Box box;
  CategoryRepositoryImpl(this.hive);

  @override
  CategoryModel get({required int id}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  List<CategoryModel> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  void initialize() {

  }

  @override
  void updateCategory({required CategoryModel category}) {
    // TODO: implement updateCategory
  }

}