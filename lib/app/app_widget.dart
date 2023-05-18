import 'package:flutter/material.dart';
import 'package:riotgg/features/main/view/main_navscreen.dart';

class MyApp extends StatefulWidget {

  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   @override
   Widget build(BuildContext context) {
       return const MaterialApp(
        title: 'RIOT GG',
        home: MainNavScreen(),

       );
  }
}