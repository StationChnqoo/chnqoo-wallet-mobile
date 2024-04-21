import 'package:chnqoo_wallet/constants/fund_chart_line.dart';
import 'package:flutter/material.dart';

class CompareRank extends StatelessWidget {
  final int index;
  final List<FundChartLine> lines;

  CompareRank({required this.index, required this.lines});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<FundChartLine> findSortedFunds() {
      if (lines.length < 3) {
        return [];
      } else {
        var _lines = [...lines];
        _lines.sort((a, b) =>
            (b.datas.last.value * 100 - a.datas.last.value * 100).toInt());
        List<FundChartLine> top3 = _lines.sublist(0, 3);
        List<FundChartLine> last3 =
            _lines.sublist(_lines.length - 3, _lines.length);
        return [top3, last3][index];
      }
    }

    return Container(
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  ['assets/wechat_666.png', 'assets/wechat_3q.png'][index],
                  height: 24,
                  width: 24,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  ['神鸡🐦排名前3', '瘟鸡🐦排名后3'][index],
                  style: TextStyle(
                      fontSize: 16, color: [Colors.red, Colors.green][index]),
                ),
              ],
            ),
            ...findSortedFunds().asMap().entries.map((e) => Container(
                margin: EdgeInsets.only(top: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        maxLines: 1,
                        '${e.value.id} · ${e.value.name}',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Text(
                      '${(e.value.datas.last.value * 100).toInt()}🥚',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    )
                  ],
                )))
          ],
        ));
  }
}
