import 'package:chnqoo_wallet/pages/compare/index.dart';
import 'package:chnqoo_wallet/pages/creator/index.dart';
import 'package:chnqoo_wallet/pages/home/index.dart';
import 'package:chnqoo_wallet/pages/quotes/index.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String APP = "/app";
  static String HOME = "/";
  static String QUOTES = '/quotes';
  static String CREATOR = '/creator';
  static String COMPARE = '/compare';

  static List<GetPage> routes = [
    // GetPage(name: APP, page: () => App()),
    GetPage(name: HOME, page: () => const HomePage()),
    GetPage(name: QUOTES, page: () => const QuotesPage()),
    GetPage(name: CREATOR, page: () => const CreatorPage()),
    GetPage(name: COMPARE, page: () => const ComparePage())
  ];
}