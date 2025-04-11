import '../../data/models/category_model.dart';

abstract class CategoryRepository {
  List<CategoryModel> getAll();

  CategoryModel get({required int id});

  void initialize();

  void updateCategory({required CategoryModel category});

  void loadBox();
}
