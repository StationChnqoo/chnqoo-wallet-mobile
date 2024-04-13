import 'package:chnqoo_wallet/pages/home/index.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String APP = "/app";
  static String HOME = "/";
  static String CONFIRM_ORDER = '/confirm_order';

  static List<GetPage> routes = [
    // GetPage(name: APP, page: () => App()),
    GetPage(name: HOME, page: () => const HomePage()),
  ];
}
