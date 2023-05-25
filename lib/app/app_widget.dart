import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riotgg/features/main/view/main_navscreen.dart';
import 'package:riotgg/shared/helpers/set_screen_mode.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RIOT GG',
      home: MainNavScreen(),
    );
  }
}
