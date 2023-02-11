import 'package:flutter/material.dart';

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
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/login_page');
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