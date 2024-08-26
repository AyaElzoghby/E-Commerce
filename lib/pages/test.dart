import 'package:flutter/material.dart';
class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
            padding: EdgeInsets.all(20),
            child: Column( 
              children: [
                TextField( 
                  decoration: InputDecoration( 
                      labelText: "Username",
                      prefixIcon: Icon(Icons.people),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                  )
                ),

                Container(height:20),

                TextField( 
                  decoration: InputDecoration( 
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Password",
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                  )
                ),

              ],
            ),
          )
       );
  }

  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return OutlineInputBorder( //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
          color:Colors.redAccent,
          width: 3,
        )
    );
  }

  OutlineInputBorder myfocusborder(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
          color:Colors.greenAccent,
          width: 3,
        )
    );
  }

  //create a function like this so that you can use it wherever you want
}