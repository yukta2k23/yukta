// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'events.dart';

class events_category extends StatefulWidget {
  String department_name ;
  String bas_event;
  events_category({Key? key,required this.bas_event, required this.department_name}) : super(key: key);

  @override
  State<events_category> createState() => _events_categoryState();
}

class _events_categoryState extends State<events_category> {
  /* events_category category */
  late var events_category_category = [
    'Technical Events',
    'Non-Technical Events',
    'Workshops'
  ];

  List<String> deptdrop=<String>
  ["ALL","CSE","ECE","EEE","CIVIL","MECH"];
  String defvaldept="ALL";

  List<String> eventty=<String>
  ["Technical","Non Technical","Workshops","Flagship ","All"];
  //String defvaldept="ALL";

  String defvalevent="All";

  /* Technical events_category list */
  late var technical_events_category = [
    'Coding',
    'Debugging',
    'codeathon',
    'models',
    'ideathon','hackathon'
  ];
  var dept="ALL";
  var deptgiven="";
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

                  /* Start - which department events_category */
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            //const SizedBox(width: 17,),
                            Expanded(
                              //department name
                              child: Text('Department of department name' ,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height:20 ,),
                        Row(
                          children: [
                            //const SizedBox(width: 17,),
                            Expanded(
                              //department name
                              child: Center(
                                child: Text('Technical events ' ,//tech nontech
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                  /* End - which department events_category */
                 //,
                  ,Spacer() ,
               Row(
                    children: [

                      Container(
                        height: 30,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          color:Colors.yellow,),
                        child: DropdownButton<String>
                        (onChanged: (String? newValue)
                        {
                          setState(() {
                            defvaldept=newValue!;
                          });
                        },
                          value:defvaldept,
                          items: deptdrop.map<DropdownMenuItem<String>>
                            ((String value)
                          {
                            return DropdownMenuItem<String>(
                              value:value,
                              child: Text(value),
                            );
                          },
                          ).toList(),
                          ),
                      ),
                      SizedBox(width: 160,),

                      Container(
                        height: 30,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          color:Colors.yellow,),
                        child: DropdownButton<String>
                          (onChanged: (String? newValue)
                        {
                          setState(() {
                            defvalevent=newValue!;
                          });
                        },
                          value:defvalevent,
                          items: eventty.map<DropdownMenuItem<String>>
                            ((String value)
                          {
                            return DropdownMenuItem<String>(
                              value:value,
                              child: Text(value),
                            );
                          },
                          ).toList(),
                        ),
                      ),


                    ],
                  )
                  ,SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child:Container(height: MediaQuery.of(context).size.height-260,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListView.builder(
                            //scrollDirection:Axis.vertical,
                           // itemCount: 6,
                            itemBuilder:(BuildContext context,int index) {
                              return Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      RawMaterialButton(
                                        onPressed: (){
                                        Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (Context) {
                                          return events(department_name: widget.department_name , category: events_category_category[index], event_name: technical_events_category[index]) ;

                                                              }
                                        )
                                        );
                                        }
                                        ,
                                        child: Container(
                                          //color: Colors.purple,
                                            height: 140,
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width-60,


                                            //eventtype [index] if only event selected
                                          //department selected then dep name eventtype [index]
                                            child: Center(child: Text("${technical_events_category[index]}",
                                              style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20) ,)),

                                          decoration:BoxDecoration(
                                          color: Colors.purple,
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        ),
                                      ),
                                      SizedBox(height: 10,)
                                    ],
                                  )

                              );
                            }
                            //length is based on the list from database
                          ,itemCount: technical_events_category.length,
                        )
                  )
                  )
                  )
/*


                  Container(
                    clipBehavior: Clip.hardEdge,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 200,
                    margin: const EdgeInsets.all(8) ,
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
                      padding: const EdgeInsets.all(8),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: events_category_category.length,
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
                                    border: Border.all()
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(events_category_category[index],
                                              style: const TextStyle(
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
                                            itemCount: technical_events_category.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context, int index1) =>
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (Context) {
                                                                  return events(department_name: widget.department_name , category: events_category_category[index1], event_name: technical_events_category[index1]) ;
                                                                }
                                                            )
                                                        ) ;
                                                      },
                                                      child: Container(
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

                  ),*/

                ],
              ),
            ),
          ),

        ],
      ),
    ) ;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
