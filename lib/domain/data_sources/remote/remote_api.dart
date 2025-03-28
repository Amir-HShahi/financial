abstract class RemoteApi {
  Future<void> userLogin(String email, String password);

  Future<void> userLoginGoogle(String accessToken, String code, String idToken);

  Future<void> userLogout();

  Future<void> getUserProfile();

  Future<void> putUserProfile();

  Future<void> patchUserProfile();

  Future<void> userRegister();

  Future<String> userTokenRefresh();
}
