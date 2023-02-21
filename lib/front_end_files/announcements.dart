import 'package:flutter/material.dart';
class announcement extends StatefulWidget {
  const announcement({Key? key}) : super(key: key);

  @override
  State<announcement> createState() => _announcementState();
}

class _announcementState extends State<announcement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:announ(),
    );
  }
}

class announ extends StatefulWidget {
  const announ({Key? key}) : super(key: key);

  @override
  State<announ> createState() => _announState();
}

class _announState extends State<announ> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        color: Colors.red,
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width-20 ,
        child: Center(child: Text("no announcements yet")),
      ),
    );
  }
}
