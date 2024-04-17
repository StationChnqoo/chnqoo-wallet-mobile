import 'dart:math';

import 'package:chnqoo_wallet/constants/bond_table.dart';
import 'package:chnqoo_wallet/constants/x.dart';
import 'package:chnqoo_wallet/widgets/my_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuotesTable extends StatelessWidget {
  BondTable bt;
  final onDoublePress;
  final onPress;

  QuotesTable(
      {required this.bt, required this.onDoublePress, required this.onPress});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(bottom: 12),
        width: double.maxFinite,
        child: MyCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/weather_${bt.weather}.png',
                      height: 32,
                      width: 32,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      bt.title,
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: 2,
              // ),
              // Text(
              //   '简单说红色越多越好 ~',
              //   style: TextStyle(color: Colors.red, fontSize: 12),
              // ),
              SizedBox(
                height: 5,
              ),
              Container(
                  width: double.maxFinite,
                  child: DataTable(
                      border: TableBorder(bottom: BorderSide.none),
                      columnSpacing: 0,
                      headingRowHeight: 24,
                      dataRowMaxHeight: 32,
                      dataRowMinHeight: 28,
                      columns: bt.columns
                          .asMap()
                          .entries
                          .map((e) => DataColumn(
                                  label: Container(
                                width: e.key == 0 ? 48 : 32,
                                child: Text(
                                  e.value,
                                  style: TextStyle(color: Colors.black54),
                                ),
                              )))
                          .toList(),
                      rows: [
                        ...bt.rows.asMap().entries.map((i) => DataRow(cells: [
                              DataCell(Text(
                                i.value.name,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 14),
                              )),
                              ...i.value.value.asMap().entries.map((j) =>
                                  DataCell(
                                    GestureDetector(
                                        onLongPress: () =>
                                            onDoublePress(i.key, j.key),
                                        onTap: () => onPress(i.key, j.key),
                                        child: Container(
                                          height: 24,
                                          width: 24,
                                          margin: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              color: [
                                                Colors.green.withOpacity(0.618),
                                                Colors.black12,
                                                Colors.red.withOpacity(0.618)
                                              ][j.value + 1]),
                                        )),
                                  ))
                            ])),
                      ])),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Row(
                    children: [
                      Text(
                        '@你这债鸡保熟吗',
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        x.useCurrentTime(),
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
