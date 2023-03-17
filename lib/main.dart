import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_application/firebase_options.dart';
import 'package:social_media_application/screens/calls.dart';
import 'package:social_media_application/screens/chats.dart';
import 'package:social_media_application/screens/people.dart';
import 'package:social_media_application/screens/settings.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF08c187),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List screens = [
    Chats(),
    Calls(),
    People(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        resizeToAvoidBottomInset: true,
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              label: "Chats",
              icon: Icon(
                CupertinoIcons.chat_bubble_2_fill,
              ),
            ),
            BottomNavigationBarItem(
              label: "Calls",
              icon: Icon(
                CupertinoIcons.phone,
              ),
            ),
            BottomNavigationBarItem(
              label: "Person",
              icon: Icon(
                CupertinoIcons.person_alt_circle,
              ),
            ),
            BottomNavigationBarItem(
              label: "Settings",
              icon: Icon(
                CupertinoIcons.settings_solid,
              ),
            ),
          ],
        ),
        tabBuilder: ((context, index) {
          return screens[index];
        }),
      ),
    );
  }
}
