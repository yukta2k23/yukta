import 'package:flutter/material.dart';

class tech_eve extends StatefulWidget {
  const tech_eve({Key? key}) : super(key: key);

  @override
  State<tech_eve> createState() => _tech_eveState();
}

class _tech_eveState extends State<tech_eve> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
    decoration: BoxDecoration(
    image:DecorationImage(
        image: AssetImage('images/image 1.png') ,
    fit:BoxFit.fill,
    ),
        ))
      ],


    );
  }
}
