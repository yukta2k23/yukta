// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yuktha2k23/front_end_files/login_page.dart';

Future<void> sign_out_dialogue(BuildContext context) async{
  return showDialog<void>(
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text("Warning",
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            content: const Text("Are you sure to SignOut?"),
            actions: [
              TextButton(
                  onPressed: () async {
                    await GoogleSignIn().signOut() ;
                    await FirebaseAuth.instance.signOut() ;
                    Navigator.pushNamedAndRemoveUntil(context, '/login_page', (route) => false) ;
                  },
                  child: const Text('Yes')
              ),
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop(false) ;
                },
                autofocus: true,
                child: const Text('Cancel'),
              )
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
        ) ;
      }
  );
}


Future<bool> exit_dialogue(BuildContext context) async{
  return await showDialog(
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Exit App",
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
          content: const Text("Do you want to exit an App?"),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop(true);
                },
                child: const Text('Yes')
            ),
            TextButton(
              onPressed: (){
                Navigator.of(context).pop(false) ;
              },
              autofocus: true,
              child: const Text('Cancel'),
            )
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
        ) ;
      }
  );
}