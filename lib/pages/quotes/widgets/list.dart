import 'package:chnqoo_wallet/constants/bond.dart';
import 'package:chnqoo_wallet/widgets/my_title_card.dart';
import 'package:flutter/material.dart';

class QuotesList extends StatelessWidget {
  List<Bond> list;

  QuotesList({required this.list});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.zero,
      child: MyTitleCard(
        title: '债券指数',
        child: Column(children: [
          ...list
              .asMap()
              .entries
              .map((e) => Container(
                    margin: EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      children: [
                        Text(
                          e.value.f14,
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        )
                      ],
                    ),
                  ))
              .toList()
        ]),
      ),
    );
  }
}
