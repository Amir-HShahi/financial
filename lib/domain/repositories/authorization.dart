abstract class Authorization {
  void login({required Function() done});

  void signup({required Function() done});

  void logout({required Function() done});
}