import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yuktha2k23/front_end_files/department_list.dart';
import 'package:yuktha2k23/front_end_files/eventtype.dart';
import 'package:yuktha2k23/front_end_files/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    title: 'Yukta',
    debugShowCheckedModeBanner: false,
    home: const login_page(),
    //home: const login_check(),

    routes:{
      '/login_page' : (context) => const login_page() ,
      '/department_list' : (context) => const department_list(),
      '/eventtype':(context) => const eventtype()
    },
  ));
}

class login_check extends StatelessWidget {
  const login_check({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){

            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),) ;
            }

            else if(snapshot.hasError){
              return const Center(child: Text("Access Denied"),) ;
            }

            else if(snapshot.hasData){
              return const department_list() ;
            }

            else{
              //print("ssss");
              return const login_page() ;
            }
          }
      ),
    );
  }
}
