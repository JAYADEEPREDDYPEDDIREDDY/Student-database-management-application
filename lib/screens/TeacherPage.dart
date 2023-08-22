import 'package:dcmeapp/screens/Fac_login_page.dart';
import 'package:dcmeapp/screens/login_page.dart';
import 'package:flutter/material.dart';

class TeacherPage extends StatelessWidget {
  const TeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
           

            
            Row(
            children: [
              Column(
                children: [
                  SizedBox( width: 100,height:60, child:  ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.arrow_back,
            color: Color.fromARGB(255, 255, 255, 255),),
            label: Text(""),
            style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 0, 0, 0), // set the background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
            ),
            ),),
                ],
              ),
             
          
              SizedBox(width: 150,),
              SizedBox(width: 100, height:60,child:OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Fac_login_page()));
                },
                child: Text("Sign In",
                style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 255, 255, 255)) ,),
              ),),
            ],
          )
          ],
        ),
      ),

    );
  }
}