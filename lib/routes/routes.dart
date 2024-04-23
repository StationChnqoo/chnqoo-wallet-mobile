import 'package:chnqoo_wallet/pages/compare/index.dart';
import 'package:chnqoo_wallet/pages/creator/index.dart';
import 'package:chnqoo_wallet/pages/daily/index.dart';
import 'package:chnqoo_wallet/pages/home/index.dart';
import 'package:chnqoo_wallet/pages/import_fund.dart/index.dart';
import 'package:chnqoo_wallet/pages/quotes/index.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String APP = "/app";
  static String HOME = "/";
  static String QUOTES = '/quotes';
  static String CREATOR = '/creator';
  static String COMPARE = '/compare';
  static String IMPORT_FUND = '/import_fund';
  static String DAILY = '/daily';

  static List<GetPage> routes = [
    // GetPage(name: APP, page: () => App()),
    GetPage(name: HOME, page: () => const HomePage()),
    GetPage(name: QUOTES, page: () => const QuotesPage()),
    GetPage(name: CREATOR, page: () => const CreatorPage()),
    GetPage(name: COMPARE, page: () => const ComparePage()),
    GetPage(name: IMPORT_FUND, page: () => const ImportFundPage()),
    GetPage(name: DAILY, page: () => const DailyPage())
  ];
}
