import 'package:flutter/material.dart';

class CreatorThanks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    lineBuilder(String icon, String title) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 3),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 24,
              width: 24,
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).primaryColor),
            )
          ],
        ),
      );
    }

    return Stack(
      children: [
        Card.filled(
            margin: EdgeInsets.zero,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Column(
                children: [
                  lineBuilder('assets/wechat_happy.png', '家人们能不能帮忙点点关注点点赞'),
                  lineBuilder('assets/wechat_dog.png', '我这天天辛辛苦苦的分享经验总结才赚几毛钱'),
                  lineBuilder('assets/wechat_watermelon.png', '电费钱都赚不回来'),
                  lineBuilder('assets/wechat_smile.png',
                      '靓仔靓妹们支持一下哈 ~ ღ( ´･ᴗ･` )比心')
                ],
              ),
            )),
        Positioned(
          child: Image.asset(
            'assets/love_u.png',
            height: 88,
            width: 88,
          ),
          right: 0,
          bottom: 0,
        )
      ],
    );
  }
}
