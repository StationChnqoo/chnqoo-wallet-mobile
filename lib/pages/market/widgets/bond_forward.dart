import 'package:chnqoo_wallet/constants/bond_forward_panel.dart';
import 'package:flutter/material.dart';

class MarketBondForward extends StatelessWidget {
  BondForwardPanel bondForwardPanel;
  MarketBondForward({required this.bondForwardPanel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bondForwardPanel.title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87),
          ),
          ...bondForwardPanel.datas.asMap().entries.map((e) => Container(
                margin: EdgeInsets.only(top: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${e.value.name}',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                    Text(
                      '${e.value.zde.toStringAsFixed(2)}%',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: e.value.zde > 0
                              ? Colors.red
                              : e.value.zde < 0
                                  ? Colors.green
                                  : Colors.black54),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
