import 'package:chnqoo_wallet/constants/bond.dart';
import 'package:chnqoo_wallet/constants/bond_news.dart';
import 'package:chnqoo_wallet/constants/config.dart';
import 'package:chnqoo_wallet/constants/get_stores.dart';
import 'package:chnqoo_wallet/constants/services.dart';
import 'package:chnqoo_wallet/pages/home/widgets/menus.dart';
import 'package:chnqoo_wallet/pages/quotes/widgets/list.dart';
import 'package:chnqoo_wallet/pages/quotes/widgets/news.dart';
import 'package:chnqoo_wallet/routes/routes.dart';
import 'package:chnqoo_wallet/widgets/my_toolbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beautiful_soup_dart/beautiful_soup.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initGetStores();
    initDatas();
    initNews();
  }
}
