import 'package:flutter/material.dart';
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
    SetScreenMode.fullScreen();
    return const MaterialApp(
      // constraints: BoxConstraints.expand(),
      debugShowCheckedModeBanner: false,
      title: 'RIOT GG',
      home: MainNavScreen(),
    );
  }
}
