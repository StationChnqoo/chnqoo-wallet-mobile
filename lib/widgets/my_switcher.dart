import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySwitcher extends StatelessWidget {
  final double? width;
  final double? height;
  final bool value;
  final ValueChanged<bool?> onChanged;
  MySwitcher(
      {this.width = 40,
      this.height = 32,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: width,
      height: height,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch(value: value, onChanged: onChanged),
      ),
    );
  }
}
