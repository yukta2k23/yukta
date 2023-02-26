// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:yuktha2k23/back_end_files/google_sign_in_function.dart';




class login_page extends StatelessWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
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
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/Yuktha_logo.png"),
                  const SizedBox(height: 50,)
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(blurRadius: 40)
                        ]
                    ),
                    child: MaterialButton(
                      onPressed: () async {

                        /* Google */
                        print("\n entered this");
                        await google_sign_in_function(context) ;
                        //Navigator.pushNamed(context, '/eventtype');
                        Navigator.pushReplacementNamed(context,'/eventtype') ;
                        //checking for a new page basic event types
                        //tech,nontech,worskshops
                        //Navigator.pushReplacementNamed(context, '/department_list') ;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/google.png'),
                          const SizedBox(width: 20,),
                          const Text('Sign In with Google',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 70,)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
