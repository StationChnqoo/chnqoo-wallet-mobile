import 'package:chnqoo_wallet/constants/bing_wall_paper.dart';
import 'package:chnqoo_wallet/constants/bond_table.dart';
import 'package:chnqoo_wallet/constants/mock.dart';
import 'package:chnqoo_wallet/constants/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetStores extends GetxController {
  /** 页面刷新 */
  /** 结构简单，直接修改value */
  var homePage = 0.obs;
  var myPage = 0.obs;

  /** 变量缓存 */
  /** 结构复杂，必须通过暴露出来的Set/Get接口修改 */
  final storage = GetStorage();
  var user = User.fromJson(Mock().initUser()).obs;
  var bingWallPaper = BingWallPaper.fromJson(Mock().initBingWallPaper()).obs;
  var bondTables = <BondTable>[].obs;
  var compareFunds = <String>[].obs;

  /** 系统变量 */
  /** 无需缓存，原则上是只能在Stores内部进行修改 */
  var isSignIn = false.obs;

  GetStores() {
    var userCache = storage.read('user');
    if (userCache != null) {
      //vuser.value = User.fromJson(userCache);
    }
    var bingWallPaperCache = storage.read("bingWallPaper");
    if (bingWallPaperCache != null) {
      bingWallPaper.value = BingWallPaper.fromJson(bingWallPaperCache);
    }
    var bondTablesCache = storage.read('bondTables');
    if (bondTablesCache == null) {
      bondTables.value = Mock()
          .initBondTables()
          .map<BondTable>((e) => BondTable.fromJson(e))
          .toList();
    } else {
      bondTables.value =
          bondTablesCache.map<BondTable>((e) => BondTable.fromJson(e)).toList();
    }

    var compareFundsCache = storage.read('compareFunds');
    if (compareFundsCache != null) {
      compareFunds.value = (compareFundsCache as List).cast<String>();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // everAll([homePage, user, bingWallPaper, isSignIn], (callback) {});
  }

  void setCompareFunds(List<String> funds) {
    compareFunds.value = funds;
    storage.write('compareFunds', funds);
  }

  void setBingWallPaper(BingWallPaper bwp) {
    bingWallPaper.value = bwp;
    storage.write("bingWallPaper", bwp);
  }

  void setBondTables(List<BondTable> tables) {
    bondTables.value = tables;
    storage.write('bondTables', tables);
  }

  void setUser(User u) {
    user.value = u;
    storage.write("user", u);
  }

  void clearUser() {
    setUser(User.fromJson(Mock().initUser()));
  }
}
