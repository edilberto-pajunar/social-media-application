import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_application/config/global_variables.dart';
import 'package:social_media_application/components/blur_image_page_scaffold.dart';
import 'package:social_media_application/components/lets_start.dart';
import 'package:social_media_application/components/logo.dart';
import 'package:social_media_application/components/terms_and_conditions.dart';
import 'package:social_media_application/screens/login/edit_number.dart';

class Hello extends StatelessWidget {
  const Hello({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurImagePageScaffold(
      imagePath: tBgImage,
      body: [
        Logo(
          height: 150,
          width: 150,
          size: 100,
        ),
        Text(
          "Hello",
          style: TextStyle(
            color: Colors.black.withOpacity(
              0.7,
            ),
            fontSize: 60,
          ),
        ),
        Column(
          children: [
            Text(
              "WhatsApp is a Cross-platform",
              style:
                  TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 20),
            ),
            Text(
              "mobile mesasge with friends",
              style:
                  TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 20),
            ),
            Text("all over the world",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7), fontSize: 20)),
          ],
        ),
        TermsAndConditions(
          onPressed: () {},
        ),
        LetsStart(
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => EditNumber()));
          },
        ),
      ],
    );
  }
}
