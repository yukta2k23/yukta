



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:yuktha2k23/front_end_files/rive_demo.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dialogue.dart';
import 'events.dart';


List<Widget> eventType = <Widget>[
  Text(
    'Technical',
    style: GoogleFonts.poppins(
        textStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    )),
  ),
  Text(
    'Non-Technical',
    style: GoogleFonts.poppins(
        textStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    )),
  ),
  Text(
    'Workshops',
    style: GoogleFonts.poppins(
        textStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    )),
  )
];
List<Widget> dept = <Widget>[
  Text(
    'CSE',
    style: GoogleFonts.poppins(
        textStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    )),
  ),
  Text(
    'ECE',
    style: GoogleFonts.poppins(
        textStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    )),
  ),
  Text(
    'EEE',
    style: GoogleFonts.poppins(
        textStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    )),
  ),
  Text(
    'Mech',
    style: GoogleFonts.poppins(
        textStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    )),
  ),
  Text(
    'Civil',
    style: GoogleFonts.poppins(
        textStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    )),
  )
];
final List<bool> _selectedType = <bool>[true, false, false];
final List<bool> _selectedDept = <bool>[true, false, false, false, false];
bool vertical = false;

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({super.key});

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override

  final db = FirebaseFirestore.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Find events that\nyou like',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontWeight: FontWeight.w700),
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                IconButton(
                  iconSize: 45,
                  onPressed: () => sign_out_dialogue(context),
                  icon: CircleAvatar(
                    backgroundImage: NetworkImage(
                        '${FirebaseAuth.instance.currentUser?.photoURL}'),
                    radius: 50,
                  ),
                ),
              ],
            ),
          ),
          ToggleButtons(
            direction: vertical ? Axis.vertical : Axis.horizontal,
            onPressed: (int index) {
              // All buttons are selectable.
              setState(() {
                _selectedType[index] = !_selectedType[index];
              });
            },
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            selectedBorderColor: Colors.grey[700],
            selectedColor: Colors.white,
            fillColor: Colors.black,
            color: Colors.black,
            constraints: const BoxConstraints(
              minHeight: 30.0,
              minWidth: 110.0,
            ),
            isSelected: _selectedType,
            children: eventType,
          ),
          ToggleButtons(

            direction: vertical ? Axis.vertical : Axis.horizontal,
            onPressed: (int index) {
              // All buttons are selectable.
              setState(() {
                _selectedDept[index] = !_selectedDept[index];
              });
            },
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            selectedBorderColor: Colors.grey[700],
            selectedColor: Colors.white,
            fillColor: Colors.black,
            color: Colors.black,
            constraints: const BoxConstraints.expand(
                height: 30.0,
                width: 70,
            ),
            isSelected: _selectedDept,
            children: dept,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 15, 0, 20),
            child: Row(
              children: [
                Text(
                  'Based on filter',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontWeight: FontWeight.w400),
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
              child: StreamBuilder(
                  stream: db.collection('events').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if(!snapshot.hasData){
                      return Center(
                        child: CircularProgressIndicator(color: Colors.black54,),
                      );
                    }
                    return ListView(
                      children: snapshot.data!.docs.map((doc){
                        return Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width/1.2,
                            height: MediaQuery.of(context).size.height/2.4,
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.height/1.2,
                                  child: Column(
                                    children: [
                                      Container(
                                        constraints:BoxConstraints(
                                            maxHeight:280
                                        ),
                                        decoration:
                                        BoxDecoration(borderRadius: BorderRadius.circular(20),
                                          boxShadow: [BoxShadow(blurRadius: 25.0,
                                            offset:Offset(2,2),
                                            spreadRadius: -25,
                                            color: Colors.grey,
                                          ),],
                                          color: Colors.amber,
                                        ),
                                        width: 350,

                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Flexible(
                                              child: Text(doc['eventName'],
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.w300,
                                                    )),
                                              ),
                                            ),
                                            Container(
                                              decoration:
                                              BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),),

                                                color: Colors.white,
                                              ),
                                              width: 350,

                                              child: Padding(
                                                padding: const EdgeInsets.all(18.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(doc['dept'],
                                                      style: GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.black54,
                                                            fontWeight: FontWeight.w500,
                                                          )),
                                                    ),
                                                    SizedBox(height: 4,),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        color: Colors.redAccent,
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.fromLTRB(6,1,6,1),
                                                        child: Text('Workshop',
                                                          style: GoogleFonts.poppins(
                                                              textStyle: TextStyle(
                                                                fontSize: 10,
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.w300,
                                                              )),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          child: Text(doc['eventName'],
                                                            style: GoogleFonts.poppins(
                                                                textStyle: TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors.black87,
                                                                  fontWeight: FontWeight.w300,
                                                                )),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(right: 8.0),
                                                          child: Text('₹'+doc['fee'],
                                                            style: GoogleFonts.poppins(
                                                                textStyle: TextStyle(
                                                                  fontSize: 23,
                                                                  color: Colors.black87,
                                                                  fontWeight: FontWeight.w700,
                                                                )),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                    const SizedBox(height: 5,),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            color: Colors.blueGrey[300],
                                                            borderRadius: BorderRadius.circular(15),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.fromLTRB(5,3,5,3),
                                                            child: Row(
                                                              children: [
                                                                Icon(Icons.calendar_month,
                                                                  color: Colors.white,
                                                                  size: 12.0,
                                                                ),
                                                                SizedBox(width: 5,),
                                                                Text('Date',
                                                                  style: GoogleFonts.poppins(textStyle: TextStyle(
                                                                      fontSize: 11,
                                                                      fontWeight: FontWeight.w300,
                                                                      color: Colors.white
                                                                  )),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }
              ),

          ),
          //scrollview of cards


        ],),
    );

  }
  }

