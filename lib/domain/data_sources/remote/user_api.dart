import '../../../data/models/auth_token_model.dart';
import '../../../data/models/register_request_model.dart';
import '../../../data/models/user_profile_model.dart';

abstract class UserApi {
  final String userPath = '/user/';

  Future<void> userLogin(String email, String password);

  Future<void> userLoginGoogle(String accessToken, String code, String idToken);

  Future<void> userLogout(AuthTokenModel token);

  Future<UserProfileModel> getUserProfile();

  Future<void> putUserProfile(UserProfileModel model);

  Future<void> userRegister(RegisterRequestModel registerRequest);

  Future<AuthTokenModel> userTokenRefresh(AuthTokenModel token);
}
