import 'package:chnqoo_wallet/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeMenus extends StatelessWidget {
  menuBuilder(context, String title, String message, String src, onPress) {
    return GestureDetector(
      onTap: onPress,
      child: Card.outlined(
        margin: EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset(
                src,
                height: 28,
                width: 28,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 6,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    message,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        overflow: TextOverflow.ellipsis),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          menuBuilder(context, '行情', '债券基金实时指数、热门资讯', 'assets/home_pencil.png',
              () {
            Get.toNamed(RoutesClass.QUOTES);
          }),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Flexible(
                  flex: 3,
                  child: menuBuilder(
                      context, '收益', '债券基金收益、排行', 'assets/home_pig.png', () {
                    Get.toNamed(RoutesClass.COMPARE);
                  })),
              SizedBox(
                width: 12,
              ),
              Flexible(
                  flex: 2,
                  child: menuBuilder(
                      context, '趋势', '基金组合对比', 'assets/home_rank.png', () {
                    Get.toNamed(RoutesClass.COMPARE);
                  }))
            ],
          )
        ],
      ),
    );
  }
}
