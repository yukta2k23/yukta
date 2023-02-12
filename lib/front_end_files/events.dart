// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:yuktha2k23/front_end_files/rive_demo.dart';

class events extends StatelessWidget {
  String department_name ;
  events({Key? key, required this.department_name}) : super(key: key);

  /* events category */
  late var events_category = [
    'Technical',
    'Non-Technical',
    'Paper presentations'
  ] ;

  /* Technical events list */
  late var technical_events = [
    'Coding',
    'Debugging'
  ] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[

          /* Start - background image layer */
          Container(
            height: MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width ,
            decoration: const BoxDecoration(
              image:DecorationImage(
                image: AssetImage('images/image 1.png') ,
                fit:BoxFit.fill,
              ),
            ),
          ),
          /* End - background image layer */

          /* Start - Transparency layer */
          Container(
            height: MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width ,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.white
                    ]
                )
            ),
          ),
          /* End - Transparency layer */

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8) ,
              child: Column(
                children: <Widget>[

                  /* Start - Banner */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      SizedBox(
                          height: 50,
                          child: Image.asset('images/Yuktha_logo.png')
                      ) ,
                      SizedBox(
                        height: 50,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop() ;
                          },
                          icon: const Icon(Icons.arrow_back,
                            color: Colors.white,
                            semanticLabel: "back",
                          )
                        ),
                      ),
                    ],
                  ),
                  /* End - Banner */

                  const SizedBox(height: 8,),

                  /* Start - which department events */
                  Row(
                    children: [
                      const SizedBox(width: 17,),
                      Expanded(
                        child: Text('Department of $department_name' ,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                      )
                    ],
                  ),
                  /* End - which department events */

                  SizedBox(height: 10,) ,

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 175,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(.5),
                          Colors.black.withOpacity(.5)
                        ]
                      ),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(100)
                      ) ,
                    ),
                    
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: events_category.length,
                        itemBuilder: (BuildContext context, int index) =>
                        Column(
                          children: [
                            Container(
                              height: 180,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(17),
                                  bottomRight: Radius.circular(17),
                                  bottomLeft: Radius.circular(17),
                                ),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.purple.withOpacity(.5),
                                      Colors.blue.withOpacity(.5)
                                    ]
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('${events_category[index]} events',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ) ,
                                      ],
                                    ),
                                    const Spacer() ,
                                    Container(
                                      height: 130,
                                      width: double.infinity,
                                      child: ListView.builder(
                                        itemCount: technical_events.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (BuildContext context, int index1) =>
                                        Row(
                                          children: [
                                            Container(
                                              height: 130,
                                              width: 250,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.circular(15),
                                                gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      Colors.white.withOpacity(.5),
                                                      Colors.black.withOpacity(.5)
                                                    ]
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10,)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 15,)
                          ],
                        ),
                      ),
                    ),
                    
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    ) ;
  }
}
