import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double? width;
  final double? height;
  final double size;
  Logo({super.key, this.width, this.height, this.size = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white.withOpacity(0.8),
      ),
      child: Icon(
        Icons.whatsapp,
        size: size,
      ),
    );
  }
}
