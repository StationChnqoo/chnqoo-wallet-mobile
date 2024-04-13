import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final imageUrl;
  final width;
  final height;
  final borderRadius;
  final BoxFit? fit;

  MyImage(
      {required this.imageUrl,
      required this.width,
      required this.height,
      required this.borderRadius,
      this.fit = BoxFit.fill});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }
}
