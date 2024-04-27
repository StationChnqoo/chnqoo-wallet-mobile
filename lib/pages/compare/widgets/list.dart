import 'package:chnqoo_wallet/constants/fund_chart_line.dart';
import 'package:chnqoo_wallet/constants/get_stores.dart';
import 'package:chnqoo_wallet/constants/x.dart';
import 'package:chnqoo_wallet/routes/routes.dart';
import 'package:chnqoo_wallet/widgets/my_title_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompareList extends StatelessWidget {
  GetStores stores = Get.find<GetStores>();
  TextEditingController tec = TextEditingController();
  List<FundChartLine> lines = [];

  CompareList({required this.lines});

  int findFund(String id) {
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].id == id) {
        return i;
      }
    }
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Obx(() => stores.compareFunds.length > 0
              ? Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: MyTitleCard(
                      title: '自选基金',
                      child: Column(
                        children: [
                          SizedBox(
                            height: 6,
                          ),
                          ...stores.compareFunds.asMap().entries.map((e) {
                            int index = findFund(e.value);
                            return Container(
                                width: double.infinity,
                                // margin: EdgeInsets.only(bottom: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 6),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 16,
                                              width: 16,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    8,
                                                  ),
                                                  color: index == -1
                                                      ? Colors.black54
                                                      : lines[index].color),
                                            ),
                                            SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                              e.value,
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        )),
                                    Flexible(
                                        fit: FlexFit.tight,
                                        child: Text(
                                          maxLines: 1,
                                          index == -1
                                              ? ''
                                              : ' · ${lines[index].name}',
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.black54,
                                              fontSize: 14),
                                        )),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    SizedBox(
                                      height: 28,
                                      width: 28,
                                      child: IconButton.outlined(
                                          padding: EdgeInsets.zero,
                                          style: ButtonStyle(),
                                          onPressed: () {
                                            var _datas = [
                                              ...stores.compareFunds
                                            ];
                                            _datas.removeAt(e.key);
                                            stores.setCompareFunds(_datas);
                                          },
                                          icon: Icon(
                                            Icons.delete_outline,
                                            size: 18,
                                          )),
                                    ),
                                  ],
                                ));
                          }),
                        ],
                      )),
                )
              : Container()),
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: tec,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                    hintText: '请输入6位数基金代码',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              )),
              SizedBox(
                width: 12,
              ),
              IconButton.filled(
                  onPressed: () {
                    if (RegExp(r'^\d{6}$').hasMatch(tec.text)) {
                      var _datas = [...stores.compareFunds, tec.text];
                      stores.setCompareFunds(_datas);
                      tec.text = "";
                    } else {
                      x.toast('添加失败', '请输入正确的基金代码 ...');
                    }
                  },
                  icon: Icon(Icons.add)),
              IconButton.outlined(
                padding: EdgeInsets.zero,
                style: ButtonStyle(),
                onPressed: () {
                  Get.toNamed(RoutesClass.IMPORT_FUND);
                },
                icon: Icon(
                  Icons.copy,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
