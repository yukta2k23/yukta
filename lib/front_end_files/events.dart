import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class events extends StatelessWidget {
  String department_name;
  String category;
  String event_name;

  events(
      {Key? key, required this.department_name, required this.category, required this.event_name})
      : super(key: key);

  // late var data = "The latest tech news about the world's best (and sometimes worst) hardware, apps, and much more. From top companies like Google and Apple to tiny startups vying for your attention, Verge Tech has the latest in what matters in technology daily." ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
              /* Start - background image layer */
              Container(
                height: MediaQuery
                    .of(context).size.height,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/image 1.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              /* End - background image layer */

              /* Start - Transparency layer */
              Container(
                height: MediaQuery
                    .of(context).size.height,
                width: MediaQuery
                    .of(context).size.width,
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
                  child: Column(
                      children: [
                        /* Start - Banner */
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [ 
                            SizedBox(
                                height: 50,
                                child: Image.asset('images/Yuktha_logo.png')
                            ),
                            SizedBox(
                              height: 50,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Icons.arrow_back, color: Colors.white,),
                                tooltip: "Back",
                              ),
                            ),
                          ],
                        ),
                        /* End - Banner */
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                            width:MediaQuery.of(context).size.width,
                              child: Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                image:DecorationImage(
                                image: AssetImage('images/poster.png') ,
                                ),
                              ),
                              ),
                            )],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height - 350,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //SizedBox(width: 20,),
                                      //name of the event
                                      //SizedBox(width:20),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Center(
                                          child: Text("CODEATHON",textAlign: TextAlign.center,style:GoogleFonts.poppins(textStyle: TextStyle(
                                        fontSize: 20,color: Colors.white,
                                      ))
                                      )
                                      ),
                                    )
                                    ],
                                  ),
                                  Row(

                                    //1st row
                                    children: [
                                        //date
                                      //SizedBox(width: 10,),
                                      Text("Date:",textAlign: TextAlign.right,style:GoogleFonts.poppins(textStyle: TextStyle(
                                        fontSize: 20,color: Colors.white,
                                      ))
                                      ),
                                      SizedBox(width: 80),
                                      //time
                                      Text("Time:",textAlign: TextAlign.right,style:GoogleFonts.poppins(textStyle: TextStyle(
                                        fontSize: 20,color: Colors.white,
                                      ))
                                      ),
                                      SizedBox(width: 80),
                                      //duration

                                      Text("Duration:",textAlign: TextAlign.right,style:GoogleFonts.poppins(textStyle: TextStyle(
                                        fontSize: 20,color: Colors.white,
                                      ))
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Text("22/03/23",textAlign: TextAlign.right,style:GoogleFonts.poppins(textStyle: TextStyle(
                                        fontSize: 20,color: Colors.white,
                                      ))
                                      ),
                                      SizedBox(width: 20),
                                      Text("10:00-1:00pm",textAlign: TextAlign.right,style:GoogleFonts.poppins(textStyle: TextStyle(
                                        fontSize: 20,color: Colors.white,
                                      ))
                                      ),
                                      SizedBox(width: 30),
                                      Text("60min",textAlign: TextAlign.right,style:GoogleFonts.poppins(textStyle: TextStyle(
                                        fontSize: 20,color: Colors.white,
                                      ))
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text("Description:",textAlign: TextAlign.right,style:GoogleFonts.poppins(textStyle: TextStyle(
                                        fontSize: 20,color: Colors.white,
                                      ))
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      //description
                                      //SizedBox(width: 10,),
                                      Expanded(
                                        child: Text("Start up with the technical stories of civil. Let your brain stay fast and quick to figure out the structures. Sharpen your smartness to make a great move in bidding. Lets see how wise you are!",textAlign: TextAlign.right,style:GoogleFonts.poppins(textStyle: TextStyle(
                                          fontSize: 20,color: Colors.white,
                                        ))
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),

                        ),

                          ]
                          )
              ),
              Positioned(bottom:10,
                  child:Container(
                    height: 65,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width:120),
                        RawMaterialButton(
                          onPressed: (){},
                          child:
                          Center(
                            child: Text("Register Now",style:GoogleFonts.poppins(textStyle: TextStyle(
                              fontSize: 20,color: Colors.white,
                            ))
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ]
        )
    );
  }
}
