import '../../../domain/data_sources/remote/user_api.dart';

class FinancialRemoteApi extends UserApi {
  @override
  Future<void> getUserProfile() {
    // TODO: implement getUserProfile
    throw UnimplementedError();
  }

  @override
  Future<void> patchUserProfile() {
    // TODO: implement patchUserProfile
    throw UnimplementedError();
  }

  @override
  Future<void> putUserProfile() {
    // TODO: implement putUserProfile
    throw UnimplementedError();
  }

  @override
  Future<void> userLogin(String email, String password) {
    // TODO: implement userLogin
    throw UnimplementedError();
  }

  @override
  Future<void> userLoginGoogle(
    String accessToken,
    String code,
    String idToken,
  ) {
    // TODO: implement userLoginGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> userLogout() {
    // TODO: implement userLogout
    throw UnimplementedError();
  }

  @override
  Future<void> userRegister() {
    // TODO: implement userRegister
    throw UnimplementedError();
  }

  @override
  Future<String> userTokenRefresh() {
    // TODO: implement userTokenRefresh
    throw UnimplementedError();
  }
}
