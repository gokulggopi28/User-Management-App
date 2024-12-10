import 'package:get/get.dart';

import '../modules/user/bindings/user_binding.dart';
import '../modules/user/views/user_view.dart';
import '../modules/user_form/bindings/user_form_binding.dart';
import '../modules/user_form/views/user_form_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.USER;

  static final routes = [
    GetPage(
      name: _Paths.USER,
      page: () =>  UserListView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.USER_FORM,
      page: () => UserFormView(),
      binding: UserFormBinding(),
    ),
  ];
}
