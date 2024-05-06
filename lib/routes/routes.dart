import 'package:chnqoo_wallet/pages/compare/index.dart';
import 'package:chnqoo_wallet/pages/creator/index.dart';
import 'package:chnqoo_wallet/pages/daily/index.dart';
import 'package:chnqoo_wallet/pages/fund_detail/index.dart';
import 'package:chnqoo_wallet/pages/home/index.dart';
import 'package:chnqoo_wallet/pages/import_fund.dart/index.dart';
import 'package:chnqoo_wallet/pages/market/index.dart';
import 'package:chnqoo_wallet/pages/quotes/index.dart';
import 'package:chnqoo_wallet/pages/warehouse/index.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String APP = "/app";
  static String HOME = "/";
  static String QUOTES = '/quotes';
  static String CREATOR = '/creator';
  static String COMPARE = '/compare';
  static String IMPORT_FUND = '/importFund';
  static String DAILY = '/daily';
  static String MARKET = '/market';
  static String FUND_DETAIL = '/fundDetail';
  static String WAREHOUSE = '/warehouse';

  static List<GetPage> routes = [
    // GetPage(name: APP, page: () => App()),
    GetPage(name: HOME, page: () => const HomePage()),
    GetPage(name: QUOTES, page: () => const QuotesPage()),
    GetPage(name: CREATOR, page: () => const CreatorPage()),
    GetPage(name: COMPARE, page: () => const ComparePage()),
    GetPage(name: IMPORT_FUND, page: () => const ImportFundPage()),
    GetPage(name: DAILY, page: () => const DailyPage()),
    GetPage(name: MARKET, page: () => const MarketPage()),
    GetPage(
      name: FUND_DETAIL,
      page: () => const FundDetailPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => FundDetailParams(Get.parameters['id']!));
      }),
    ),
    GetPage(name: WAREHOUSE, page: () => const WarehousePage()),
  ];
}