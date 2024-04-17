import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:chnqoo_wallet/constants/bond.dart';
import 'package:chnqoo_wallet/constants/bond_news.dart';
import 'package:chnqoo_wallet/constants/config.dart';
import 'package:chnqoo_wallet/constants/get_stores.dart';
import 'package:chnqoo_wallet/constants/services.dart';
import 'package:chnqoo_wallet/pages/quotes/widgets/chart.dart';
import 'package:chnqoo_wallet/pages/quotes/widgets/list.dart';
import 'package:chnqoo_wallet/pages/quotes/widgets/news.dart';
import 'package:chnqoo_wallet/pages/quotes/widgets/table.dart';
import 'package:chnqoo_wallet/routes/routes.dart';
import 'package:chnqoo_wallet/widgets/my_toolbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => QuotesPageState();
}

class QuotesPageState extends State<QuotesPage> {
  ScrollController? swiper;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GetStores stores = Get.find<GetStores>();
  List<Bond> bonds = [];
  List<BondNews> news = [];
  Map<String, int> countMap = {};

  onDoublePress(int i, int j, int k) {
    onUpdateTables(i, j, k, 2);
  }

  onPress(int i, int j, int k) {
    onUpdateTables(i, j, k, 1);
  }

  onUpdateTables(int i, int j, int k, int clicks) {
    var _tables = [...stores.bondTables];
    int iint = _tables[i].rows[j].value[k];
    _tables[i].rows[j].value[k] = [0, iint == 0 ? 1 : -iint, 0][clicks];
    stores.setBondTables(_tables);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyToolBar(title: '行情看板', onBackPress: () => Get.back()),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: Config.PAGE_PADDING),
        decoration: BoxDecoration(
            color: CupertinoColors.systemBrown.color.withOpacity(0.09)),
        // padding: EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            QuotesList(list: bonds),
            Obx(() => Column(
                  children: [
                    ...stores.bondTables.asMap().entries.map(
                          (e) => QuotesTable(
                            bt: e.value,
                            onDoublePress: (j, k) => onDoublePress(e.key, j, k),
                            onPress: (j, k) => onPress(e.key, j, k),
                          ),
                        ),
                  ],
                )),
            QuotesChart(countMap: countMap),
            QuotesNews(datas: news),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Row(
                    children: [
                      OutlinedButton(onPressed: () {}, child: Text('参数设置')),
                      SizedBox(
                        width: 24,
                      ),
                      FilledButton(
                          onPressed: () {
                            Get.toNamed(RoutesClass.CREATOR);
                          },
                          child: Text('一键生成文案 '))
                    ],
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

  initGetStores() {}

  initDatas() async {
    var result = await Services().selectEastMoneyBonds();
    var data = result['data'] as Map<String, dynamic>;
    //  List<dynamic> diff = json.decode(data['diff']).cast<Map<String, dynamic>>();
    // var diff = data['diff'] as Map<String, dynamic>;
    bonds = data['diff'].map<Bond>((json) => Bond.fromJson(json)).toList();
    setState(() {});
  }

  String findClassText(Bs4Element e, String class_) =>
      e.find('p', class_: class_)!.text.trim();
  initNews() async {
    var result = await Services().selectEastMoneyBondsNews();
    BeautifulSoup bs = BeautifulSoup(result.toString());
    var ul = bs.find('ul', class_: 'guidance_list guidance_325 active');
    var lis = ul!.findAll('li');
    news = lis
        .map<BondNews>((e) => BondNews(
            title: findClassText(e, 'title'),
            detail: findClassText(e, 'detail'),
            time: findClassText(e, 'time'),
            tags: []))
        .toList();
    setState(() {});
  }

  initZhishubao() async {
    var result = await Services().selectZhishubao();
    BeautifulSoup bs = BeautifulSoup(result.toString());
    var lis = bs.findAll('li');
    for (int i = 0; i < lis.length; i++) {
      Bs4Element item = lis[i];
      if (item.text.contains("中债")) {
        // double percentage = double.parse(percentageString.replaceAll('%', '')) / 100;
        String value = item.find('span', class_: 'name fr bold')!.text;
        double _value = double.parse(value.replaceAll('%', ''));
        if (countMap.containsKey(value)) {
          countMap[value] = countMap[value]! + 1;
        } else {
          countMap[value] = 1;
        }
        // print(item.getAttrValue('title')! + _value.toString());
        // print(item.find('span', class_: 'name fl')!.text);
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initGetStores();
    initDatas();
    initNews();
    initZhishubao();
  }
}
