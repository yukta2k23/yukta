import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yuktha2k23/front_end_files/department_list.dart';
import 'package:yuktha2k23/front_end_files/rive_demo.dart';

import 'dialogue.dart';
import 'events.dart';

class eventtype extends StatefulWidget {
  const eventtype({Key? key}) : super(key: key);

  @override
  State<eventtype> createState() => _eventtypeState();
}

class _eventtypeState extends State<eventtype> {
  @override
  late var basevents = [
    "Technical","Non Technical","Workshops","Flagship"
  ] ;
  late var basevents_icons=["tech","nontech","work","Flag"
  ];
  var event_color = [
    [const Color.fromARGB(255, 194, 243, 250),const Color.fromARGB(255, 187, 211, 239)],
    [const Color.fromARGB(255, 105, 177, 255),const Color.fromARGB(255, 187, 220, 239)],
    [const Color.fromARGB(255, 255, 213, 105),const Color.fromARGB(255, 239, 203, 187)],
    [const Color.fromARGB(255, 117, 255, 105),const Color.fromARGB(255, 95, 152, 54)]
  ];
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
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [

                        /* Start - Banner */
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            SizedBox(
                                height: 50,
                                child: Image.asset('images/Yuktha_logo.png')
                            ) ,
                            IconButton(
                              onPressed: () =>  sign_out_dialogue(context),
                              icon: CircleAvatar(
                                child: Image.network('${FirebaseAuth.instance.currentUser?.photoURL}',
                                ),
                              ),
                            ),
                          ],
                        ),
                        /* End - Banner */

                        const SizedBox(height: 8,),

                        /* Start - User name */
                        Row(
                          children: [
                            const SizedBox(width: 17,),
                            //Text("hello ramkumar",
                            Text("Hello  ${FirebaseAuth.instance.currentUser!.displayName}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white
                              ),
                            )
                          ],
                        ),
                        /* End - User name */

                        const SizedBox(height: 25,),

                        /* Start - Departments list view */
                        Container(
                          height: MediaQuery.of(context).size.height - 250,
                          width: MediaQuery.of(context).size.width,

                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: basevents.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Padding(
                                  padding: const EdgeInsets.only(left: 15,right: 15,),
                                  child: Column(
                                    children: [
                                      //const SizedBox(height: 40,),

                                      InkWell(

                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (Context) {
                                                    return department_list(b_event:basevents[index]);
                                                   //return department_list(base_event:basevents[index]);
                                                  }
                                              )
                                          ) ;
                                        },

                                        child: Container(
                                          height: 100,
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.white54,
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Container(
                                              height: (MediaQuery.of(context).size.height-200)/4,
                                              width: MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end: Alignment.bottomRight,
                                                      colors: [
                                                        event_color[index][0],
                                                        event_color[index][1],
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
                                                      child: Text(basevents[index],
                                                        style: const TextStyle(
                                                            fontSize: 23
                                                        ),
                                                      ),
                                                    ),
                                                    Container(height:60,
                                                        width:80,child:
                                                    Image.asset('images/${basevents_icons[index]}.png',
                                                      scale: .8,)
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 40,),
                                    ],
                                  ),
                                ),
                          ),
                        ),
                        /* End - Departments list view */

                      ],
                    ),
                  )
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RawMaterialButton(
                      onPressed: () async =>(){},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        margin: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(20),
                            /*
                        image:DecorationImage(
                          image: AssetImage('images/image 1.png') ,
                          fit:BoxFit.fitWidth,
                        ),
                         */
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 500,
                                  color: Colors.purple,
                                  blurStyle: BlurStyle.outer
                              ),
                            ]
                        ),
                        child: Container(
                          width:MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.double_arrow,
                                size: 20,
                              ),
                              SizedBox(width: 8,),
                              Text('Register Now To Participate',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}
