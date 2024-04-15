import 'package:chnqoo_wallet/pages/creator/index.dart';
import 'package:chnqoo_wallet/pages/home/index.dart';
import 'package:chnqoo_wallet/pages/quotes/index.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String APP = "/APP";
  static String HOME = "/";
  static String QUOTES = '/QUOTES';
  static String CREATOR = '/CREATOR';

  static List<GetPage> routes = [
    // GetPage(name: APP, page: () => App()),
    GetPage(name: HOME, page: () => const HomePage()),
    GetPage(name: QUOTES, page: () => const QuotesPage()),
    GetPage(name: CREATOR, page: () => CreatorPage())
  ];
}
