// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String sayHello(Object name) {
    return 'Hello, $name!';
  }

  @override
  String get haveANiceDay => 'Have a nice day!';

  @override
  String get createAccount => 'Create Account';

  @override
  String get fillInformation => 'Fill your information below or register\nwith your social account';

  @override
  String get fullName => 'Full Name';

  @override
  String get email => 'Email';

  @override
  String get enterEmailHint => 'Enter your email';

  @override
  String get password => 'Password';

  @override
  String get passwordConfirmation => 'Password Confirmation';

  @override
  String get signUpButton => 'Sign up';

  @override
  String get orSignUpWith => 'Or sign up with';

  @override
  String get signIn => 'Sign In';

  @override
  String get welcomeBack => 'Hi! Welcome back, you’ve been missed';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get signInButton => 'Sign in';

  @override
  String get orSignInWith => 'Or sign in with';

  @override
  String get pushToCreateAccount => 'Don’t have account? Sign up.';

  @override
  String get signUpHighlight => 'Sign up.';

  @override
  String get accountDetails => 'Account Details';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get changePassword => 'Change Password';

  @override
  String get currentPassword => 'Current Password';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get leavingMessage => 'Oh no! You’re leaving...\nAre you sure?';

  @override
  String get justKidding => 'Naah, Just Kidding';

  @override
  String get confirmLogout => 'Yes, Log Me Out';

  @override
  String get signOut => 'Sign Out';

  @override
  String get addIncome => 'Add Income';

  @override
  String get howMuchReceived => 'How much did you receive today?';

  @override
  String get add => 'Add';

  @override
  String get addExpense => 'Add Expense';

  @override
  String get howMuchSpent => 'How much did you spend today?';

  @override
  String get forWhat => 'For what?';

  @override
  String get chooseCategory => 'Choose Category';

  @override
  String get expense => 'Expense';

  @override
  String get income => 'Income';
}
