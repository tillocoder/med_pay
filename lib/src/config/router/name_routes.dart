part of 'app_routes.dart';

sealed class Routes {
  Routes._();

  static const String initial = '/';

  /// main
  static const String main = '/main';
  static const String internetConnection = '/internet_connection';
  static const String orderPage='/order_page';
  /// profile
  static const String aboutUs = '/about_us';
  static const String settings = '/settings';
  static const String branchs = '/branchs';
  static const String branchsDetail = '/branchsDetail';

  /// auth
  static const String auth = '/auth';
  static const String confirmCode = '/confirm_code';
  static const String register = '/register';
}
