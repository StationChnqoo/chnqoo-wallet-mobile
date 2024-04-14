import 'package:chnqoo_wallet/constants/bond_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuotesNews extends StatelessWidget {
  List<BondNews> datas;

  QuotesNews({required this.datas});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          ...datas.asMap().entries.map((e) => Container(
                margin: EdgeInsets.only(bottom: 12),
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.value.title,
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      e.value.detail,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                      maxLines: 4,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
