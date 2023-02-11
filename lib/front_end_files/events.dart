import 'package:flutter/material.dart';

class events extends StatefulWidget {
  const events({Key? key}) : super(key: key);

  @override
  State<events> createState() => _eventsState();
}

class _eventsState extends State<events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
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
              /* Start - Transparency layer */

              SafeArea(
                child: Container(
                  height:MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset("images/Yuktha_logo.png",
                            height:100,
                            width:200,
                          ),
                          SizedBox(width: 100,),
                          Tooltip(
                            message: "back",
                            waitDuration: Duration(seconds: 1),
                            showDuration: Duration(seconds: 2),
                            child:
                            Image.asset("images/exit.png",height:80 ),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Technical events",
                            style: TextStyle(
                                color: Colors.green,fontSize: 20,
                                fontWeight: FontWeight.bold),),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:Colors.yellow,
                        ),
                      )
                    ],





                  ),
                ),
              )

            ]


        ),
      ),

    ) ;
  }
}
