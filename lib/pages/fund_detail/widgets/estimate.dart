import 'package:chnqoo_wallet/constants/config.dart';
import 'package:flutter/material.dart';

class FundDetailEstimate extends StatelessWidget {
  final String id;
  FundDetailEstimate({required this.id});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width - Config.PAGE_PADDING * 2;
    double height = width * 9 / 16;
    return id == ''
        ? Container()
        : Container(
            // padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Text(
                    '实时估值',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                ),
                Stack(
                  children: [
                    Image.network(
                      'https://image.sinajs.cn/newchart/v5/fundpre/min_s/${id}.gif',
                      width: width,
                      height: height,
                    ),
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(12),
                                    topLeft: Radius.circular(12)),
                                color: Colors.black.withOpacity(0.8)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '请点赞关注',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                    Image.asset(
                                      'assets/love_u.png',
                                      height: 32,
                                      width: 32,
                                    ),
                                  ],
                                ),
                                Text(
                                  '@花式养鸡总冠军',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ],
                            )))
                  ],
                ),
              ],
            ));
  }
}
