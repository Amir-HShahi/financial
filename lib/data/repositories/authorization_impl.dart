import '../../domain/repositories/authorization.dart';
import '../../domain/repositories/dependency_injector.dart';
import 'local_auth_handler.dart';

class AuthorizationImpl implements Authorization {
  late final LocalAuthHandler localAuth;
  AuthorizationImpl() {
    localAuth = DependencyInjector.locator<LocalAuthHandler>();
  }

  @override
  void login({required Function() done}) async {
    if (await localAuth.authenticate()) {
      DependencyInjector.authorizedSetup();
      done();
    }
  }

  @override
  void logout({required Function() done}) {
    // TODO: implement logout
  }

  @override
  void signup({required Function() done}) async {
    if (await localAuth.authenticate()) {
    DependencyInjector.authorizedSetup();
    done();
    }
  }
}
