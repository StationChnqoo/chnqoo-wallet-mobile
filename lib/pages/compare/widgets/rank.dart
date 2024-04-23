import 'package:chnqoo_wallet/constants/fund_chart_line.dart';
import 'package:chnqoo_wallet/constants/x.dart';
import 'package:flutter/material.dart';

class CompareRank extends StatelessWidget {
  final int index;
  final List<FundChartLine> lines;
  final List<DateTime> times;

  CompareRank({required this.index, required this.lines, required this.times});

  int SIZE = 5;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<FundChartLine> findSortedFunds() {
      if (lines.length < SIZE) {
        return [];
      } else {
        var _lines = [...lines];
        _lines.sort((a, b) =>
            (b.datas.last.value * 100 - a.datas.last.value * 100).toInt());
        List<FundChartLine> top3 = _lines.sublist(0, SIZE);
        List<FundChartLine> last3 =
            _lines.sublist(_lines.length - SIZE, _lines.length);
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      ['排名前${SIZE}神鸡🐤', '排名后${SIZE}瘟鸡🐤'][index],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: [Colors.red, Colors.green][index]),
                    ),
                  ],
                ),
                Text(
                  '${x.formatDate(times[0])} ~ ${x.formatDate(times[1])}',
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                )
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
