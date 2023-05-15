import 'package:flutter/material.dart';
import 'package:riotgg/features/main/pages/home/view/home_page.dart';

class MyApp extends StatefulWidget {

  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   @override
   Widget build(BuildContext context) {
       return MaterialApp(
        title: 'RIOT GG',
        home: const HomePage(),

       );
  }
}