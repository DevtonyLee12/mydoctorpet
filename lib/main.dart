import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mypet_doctor/ui/doc_list_page.dart';
import 'package:mypet_doctor/ui/home_page.dart';

void main() => runApp(
      MaterialApp(
        title: 'Navigator',
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return homePage();
  }
}
