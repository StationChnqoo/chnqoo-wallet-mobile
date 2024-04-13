import 'package:flutter/material.dart';
import 'package:chnqoo_wallet/widgets/my_card.dart';

class MyTitleCard extends StatelessWidget {
  final Widget child;
  final String title;

  MyTitleCard({required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    // return Card.filled(
    //     child: Container(
    //       padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
    //       child: child,
    //     ),
    //     elevation: 0.1);
    return MyCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w500),
          ),
          child
        ],
      ),
    );
  }
}
