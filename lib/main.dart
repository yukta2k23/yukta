import 'package:flutter/material.dart';
import 'package:yuktha2k23/front_end_files/department_list.dart';
import 'package:yuktha2k23/front_end_files/events.dart';
import 'package:yuktha2k23/front_end_files/login_page.dart';

Future<void> main() async{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: events(),
    routes:{
      '/login_page' : (context) => const login_page() ,
      '/department_list' : (context) => const department_list()
    },
  ));
}