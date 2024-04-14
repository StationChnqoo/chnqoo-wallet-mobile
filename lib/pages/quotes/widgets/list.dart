import 'package:chnqoo_wallet/constants/bond.dart';
import 'package:chnqoo_wallet/constants/x.dart';
import 'package:chnqoo_wallet/widgets/my_title_card.dart';
import 'package:flutter/material.dart';

class QuotesList extends StatelessWidget {
  List<Bond> list;

  QuotesList({required this.list});

  String toPercentString(dynamic s) {
    return s is String ? s : '${s.toString()}%';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 12),
      child: MyTitleCard(
        title: '债券指数',
        
        child: Column(children: [
          ...list
              .asMap()
              .entries
              .map((e) => Container(
                    margin: EdgeInsets.only(top: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${e.value.f12} ${e.value.f14}',
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                        Text(
                          toPercentString(e.value.f3),
                          style: TextStyle(
                              color: e.value.f3 is num
                                  ? e.value.f3 > 0
                                      ? Colors.redAccent
                                      : Colors.greenAccent
                                  : Colors.black87,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ))
              .toList()
        ]),
      ),
    );
  }
}
