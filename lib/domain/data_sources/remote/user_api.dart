import 'package:financial/domain/entities/user_profile.dart';

abstract class UserApi {
  Future<void> userLogin(String email, String password);

  Future<void> userLoginGoogle(String accessToken, String code, String idToken);

  Future<void> userLogout();

  Future<UserProfile> getUserProfile();

  Future<UserProfile> putUserProfile();

  Future<UserProfile> patchUserProfile();

  Future<void> userRegister();

  Future<String> userTokenRefresh();
}
