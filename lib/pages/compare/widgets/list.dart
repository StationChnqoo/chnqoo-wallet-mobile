import 'package:chnqoo_wallet/constants/get_stores.dart';
import 'package:chnqoo_wallet/widgets/my_title_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CompareList extends StatelessWidget {
  GetStores stores = Get.find<GetStores>();
  TextEditingController tec = TextEditingController();

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
                          ...stores.compareFunds
                              .asMap()
                              .entries
                              .map((e) => Container(
                                  width: double.infinity,
                                  // margin: EdgeInsets.only(bottom: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 6),
                                        child: Text(
                                          e.value,
                                          style: TextStyle(fontSize: 16),
                                        ),
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
                                              Icons.delete,
                                              size: 18,
                                            )),
                                      )
                                    ],
                                  ))),
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
                    var _datas = [...stores.compareFunds, tec.text];
                    stores.setCompareFunds(_datas);
                    tec.text = "";
                  },
                  icon: Icon(Icons.add))
            ],
          )
        ],
      ),
    );
  }
}
