import 'package:flutter/material.dart';

import '../pages/dialogue.dart';

class department_list extends StatefulWidget {
  const department_list({Key? key}) : super(key: key);

  @override
  State<department_list> createState() => _department_listState();
}

class _department_listState extends State<department_list> {

  /* Department details */
  late var departments = [
    "Computer Science and Enginnering",
    "Electronics and Communication Engineering",
    "Electrical and Electronics Engineering",
    "Civil Engineering",
    "Mechanical Engineering"
  ] ;

  /* Department icons */
  late var departments_icon = ["cse","ece","eee","civil","mech"] ;

  /* Department color */
  var departments_color = [
    [const Color.fromARGB(255, 194, 243, 250),const Color.fromARGB(255, 187, 211, 239)],
    [const Color.fromARGB(255, 250, 227, 195),const Color.fromARGB(255, 239, 190, 187)],
    [const Color.fromARGB(255, 105, 177, 255),const Color.fromARGB(255, 187, 220, 239)],
    [const Color.fromARGB(255, 255, 213, 105),const Color.fromARGB(255, 239, 203, 187)],
    [const Color.fromARGB(255, 206, 165, 246),const Color.fromARGB(255, 195, 187, 239)]
  ];

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () => exit_dialogue(context) ,
      child: Scaffold(
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
            /* Start - background image layer */

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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
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
                                sign_out_dialogue(context) ;
                              },
                              icon: Image.asset('images/exit.png',),
                              tooltip: "Sign Out",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8,),
                      Row(
                        children: const [
                          SizedBox(width: 17,),
                          Text("Hello \$name",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 25,),
                      Positioned(
                        bottom: 100,
                        child: Container(
                          height: MediaQuery.of(context).size.height - 220,
                          width: MediaQuery.of(context).size.width,

                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: departments.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Padding(
                                  padding: const EdgeInsets.only(left: 15,right: 15,),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.white54,
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Container(
                                            height: 100,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      departments_color[index][0],
                                                      departments_color[index][1],
                                                    ]
                                                ),
                                                borderRadius: BorderRadius.circular(15)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(departments[index],
                                                      style: const TextStyle(
                                                          fontSize: 23
                                                      ),
                                                    ),
                                                  ),

                                                  Image.asset('images/${departments_icon[index]}.png',
                                                    scale: .8,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                    ],
                                  ),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ]
        ),
      ),
    );
  }
}
