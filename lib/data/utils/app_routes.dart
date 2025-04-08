import 'package:financial/presentation/pages/account_details.dart';
import 'package:financial/presentation/pages/add_expense.dart';
import 'package:financial/presentation/pages/add_income.dart';
import 'package:financial/presentation/pages/change_password.dart';
import 'package:financial/presentation/pages/profile.dart';
import 'package:flutter/cupertino.dart';

import '../../presentation/pages/home.dart';

abstract class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/home': (context) => const Home(),
    '/profile': (context) => const Profile(),
    '/account_details': (context) => const AccountDetails(),
    '/change_password': (context) => const ChangePassword(),
    '/add_expense': (context) => const AddExpense(),
    '/add_income': (context) => const AddIncome(),
  };
}
