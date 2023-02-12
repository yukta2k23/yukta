import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class rive_demo extends StatefulWidget {
  const rive_demo({Key? key}) : super(key: key);

  @override
  State<rive_demo> createState() => _rive_demoState();
}

class _rive_demoState extends State<rive_demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red
            ),
            child: RiveAnimation.asset('images/menu_interactions.riv')
        ) ,
      ),
    );
  }
}
