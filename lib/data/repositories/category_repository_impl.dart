import 'package:financial/data/models/category_model.dart';
import 'package:financial/domain/repositories/category_repository.dart';
import 'package:hive/hive.dart';

import '../../domain/repositories/dependency_injector.dart';
import '../data_sources/local/hive_database_impl.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  late final Box box;
  CategoryRepositoryImpl() {
    loadBox();
  }

  @override
  CategoryModel get({required int id}) {
    var json = box.get(id);
    return CategoryModel.fromJson(json);
  }

  @override
  List<CategoryModel> getAll() {
    List<CategoryModel> models = [];
    for (int i = 0; i < box.length; i++) {
      CategoryModel model = CategoryModel.fromJson(box.getAt(i));
      models.add(model);
    }
    return models;
  }

  @override
  void initialize() {}

  @override
  void updateCategory({required CategoryModel category}) {
    var json = category.toJson();
    box.put(category.id, json);
  }

  @override
  void loadBox() async {
    var db = DependencyInjector.locator<HiveDatabaseImpl>();
    box = await db.getCategoriesBox();
  }
}
