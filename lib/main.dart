import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:social_media_application/firebase_options.dart';
import 'package:social_media_application/screens/login/edit_number.dart';
import 'package:social_media_application/screens/login/hello.dart';
import 'package:social_media_application/screens/login/select_country.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Hello(),
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF08c187),
      ),
    );
  }
}
