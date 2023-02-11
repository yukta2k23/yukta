import 'package:flutter/material.dart';
import 'package:yuktha2k23/pages/department_list.dart';
import 'package:yuktha2k23/pages/login_page.dart';

Future<void> main() async{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: login_page(),
    routes: {
      '/login_page' : (context) => const login_page() ,
      '/department_list' : (context) => const department_list()
    },
  ));
}
