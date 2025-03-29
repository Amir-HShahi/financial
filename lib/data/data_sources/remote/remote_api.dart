import 'package:dio/dio.dart';
import 'package:financial/data/models/category_model.dart';
import 'package:financial/data/models/register_request_model.dart';
import 'package:financial/domain/data_sources/remote/finance_api.dart';

import '../../../domain/data_sources/remote/user_api.dart';
import '../../models/auth_token_model.dart';
import '../../models/transaction_model.dart';
import '../../models/user_profile_model.dart';

class RemoteApi implements UserApi, FinanceApi {
  @override
  String get financePath => throw UnimplementedError();

  @override
  String get userPath => throw UnimplementedError();

  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://mohammadhtavakoli.pythonanywhere.com/api/',
      contentType: 'application/json',
    ),
  );

  @override
  Future<void> decreaseBudget(CategoryModel category) async {
    await _dio.put(
      '$financePath/categories/${category.id}/decrease_budget/',
      data: category.toJson(),
    );
  }

  @override
  Future<void> deleteTransaction(int id) async {
    await _dio.delete('$financePath/transactions/$id');
  }

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final response = await _dio.get('$financePath/categories/');

    final List<dynamic> categoriesJson = response.data;
    return categoriesJson.map((json) => CategoryModel.fromJson(json)).toList();
  }

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    final response = await _dio.get('$financePath/transactions/');

    final List<dynamic> categoriesJson = response.data;
    return categoriesJson
        .map((json) => TransactionModel.fromJson(json))
        .toList();
  }

  @override
  Future<CategoryModel> getCategory(int id) async {
    Response response = await _dio.get('$financePath/categories/$id');
    return CategoryModel.fromJson(response.data);
  }

  @override
  Future<TransactionModel> getTransaction(int id) async {
    Response response = await _dio.get('$financePath/transactions/$id');
    return TransactionModel.fromJson(response.data);
  }

  @override
  Future<UserProfileModel> getUserProfile() async {
    final response = await _dio.get('$financePath/profile/');

    return UserProfileModel.fromJson(response.data);
  }

  @override
  Future<void> increaseBudget(CategoryModel category) async {
    await _dio.put(
      '$financePath/categories/${category.id}/increase_budget/',
      data: category.toJson(),
    );
  }

  @override
  Future<void> postTransaction(TransactionModel transaction) async {
    await _dio.post('$financePath/transactions/', data: transaction.toJson());
  }

  @override
  Future<void> putUserProfile(UserProfileModel model) async {
    await _dio.put('$userPath/profile/');
  }

  @override
  Future<void> userLogin(String email, String password) async {
    await _dio.post(
      '$userPath/login/',
      data: {"email": email, "password": password},
    );
  }

  @override
  Future<void> userLoginGoogle(
    String accessToken,
    String code,
    String idToken,
  ) async {}

  @override
  Future<void> userLogout(AuthTokenModel token) async {
    await _dio.post('$userPath/logout/', data: token.toJson());
  }

  @override
  Future<void> userRegister(RegisterRequestModel registerRequest) async {
    await _dio.post('$userPath/register/', data: registerRequest.toJson());
  }

  @override
  Future<AuthTokenModel> userTokenRefresh(AuthTokenModel authTokenModel) async {
    final response = await _dio.post(
      '$userPath/token/refresh/',
      data: authTokenModel.toJson(),
    );

    return AuthTokenModel.fromJson(response.data);
  }
}
