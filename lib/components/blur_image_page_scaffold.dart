import 'dart:ui';

import 'package:flutter/material.dart';

import '../config/global_variables.dart';

class BlurImagePageScaffold extends StatelessWidget {
  final body;
  final imagePath;

  const BlurImagePageScaffold({super.key, this.imagePath, this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            tBgImage,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.black.withOpacity(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: body,
          ),
        ),
      ),
    );
  }
}
