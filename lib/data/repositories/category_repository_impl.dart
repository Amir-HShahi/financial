import 'package:financial/data/models/category_model.dart';
import 'package:financial/data/repositories/encryption_impl.dart';
import 'package:financial/domain/repositories/category_repository.dart';
import 'package:hive/hive.dart';

import '../../domain/repositories/dependency_injector.dart';
import '../data_sources/local/hive_database_impl.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  late final Box box;
  late final EncryptionImpl en;
  CategoryRepositoryImpl() {
    en = DependencyInjector.locator<EncryptionImpl>();
    loadBox();
  }

  @override
  CategoryModel get({required int id}) {
    var json = box.get(id);
    json = en.decryptJson(json: json);
    return CategoryModel.fromJson(json);
  }

  @override
  List<CategoryModel> getAll() {
    List<CategoryModel> models = [];
    for (int i = 0; i < box.length; i++) {
      var json = box.getAt(i);
      json = en.decryptJson(json: json);
      CategoryModel model = CategoryModel.fromJson(json);
      models.add(model);
    }
    return models;
  }

  @override
  void initialize() {}

  @override
  void updateCategory({required CategoryModel category}) {
    var json = category.toJson();
    json = en.encryptJson(json: json);
    box.put(category.id, json);
  }

  @override
  void loadBox() async {
    var db = DependencyInjector.locator<HiveDatabaseImpl>();
    box = await db.getCategoriesBox();
  }
}
