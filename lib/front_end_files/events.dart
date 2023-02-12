import 'package:flutter/material.dart';

class events extends StatelessWidget {
  String department_name;
  String category;
  String event_name;
  events({Key? key, required this.department_name, required this.category, required this.event_name}) : super(key: key);

  late var data = "The latest tech news about the world's best (and sometimes worst) hardware, apps, and much more. From top companies like Google and Apple to tiny startups vying for your attention, Verge Tech has the latest in what matters in technology daily." ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                    SizedBox(
                      height: 50,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop() ;
                        },
                        icon: const Icon(Icons.arrow_back,color: Colors.white,),
                        tooltip: "Back",
                      ),
                    ),
                  ],
                ),
                /* End - Banner */


                SizedBox(height: 10),

              ],
            ),
          ),

          Positioned(
            top: 200,
            child: Container(
              height: MediaQuery.of(context).size.height - 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                //boxShadow: [
                  //BoxShadow(
                    //blurRadius: 40,
                  //)
                //]
              ),


              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height:8),
                    Text("EVENT NAME:") ,
                    SizedBox(height: 8),
                    Text("\tt\t\t $event_name"),
                    SizedBox(height:8),
                    Text("EVENT DESCRIPTION:") ,
                    SizedBox(height: 8),
                    Text("\tt\t\t asdnfkdfnsdknvsdkvndskvnds"),
                    SizedBox(height:8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width / 3 - 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("date:"),
                              Text("53232"),
                            ],
                          ),
                        ),
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width / 3 - 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("date:"),
                              Text("53232"),
                            ],
                          ),
                        ),
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width / 3 - 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("date:"),
                              Text("53232"),
                            ],
                          ),
                        )
                      ],
                    )

                  ],
                ),
              ),

            ),
          )

        ],
      ),
    );
  }
}
