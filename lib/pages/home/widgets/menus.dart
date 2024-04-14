import 'package:chnqoo_wallet/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeMenus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutesClass.QUOTES);
      },
      child: Card.outlined(
        margin: EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Image.asset(
                'assets/home_pencil.png',
                height: 32,
                width: 32,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '债券基金行情报表',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '一键生成当日债券基金行情',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
