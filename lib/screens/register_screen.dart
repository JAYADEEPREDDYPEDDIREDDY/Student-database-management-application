import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _pinNumberController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _semesterController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register new student")),
      body: SingleChildScrollView(
      child: Column(
        
        children: [
          
          SizedBox(height: 10,),
          Text("Enter the following details ", style:  TextStyle(fontSize: 30 ,),),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.only(left:10.0,right: 10.0),
            child: TextField(
                     controller: _emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'email ID',
                    ),
                  ),     
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.only(left:10.0,right: 10.0),
          child :TextField(
            
                       controller: _studentNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Student name',
                      ),
                    ),
                    
          ),
                  SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.only(left:10.0,right: 10.0), child: TextField(
                       controller: _pinNumberController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Pin number',
                      ),
                    ), ),
                     SizedBox(height: 20,),
          Container( 
            padding: EdgeInsets.only(left:10.0,right: 10.0),child :TextField(
                       controller: _mobileNumberController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mobile number',
                      ),
                    ), ),
                     SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.only(left:10.0,right: 10.0),child: TextField(
                       controller: _branchController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Branch',
                      ),
                    ),),
                     SizedBox(height: 20,),
         Container( 
           padding: EdgeInsets.only(left:10.0,right: 10.0),child: TextField(
                       controller: _semesterController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Semester',
                      ),
                    ),),
                    SizedBox(height: 20,),
         Container( 
          padding: EdgeInsets.only(left:10.0,right: 10.0),
          child: TextField(
                       controller: _passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),  ),

               SizedBox(height: 20,),
               ElevatedButton(onPressed: (){
                 Map<String, dynamic> userData = {
      'email': _emailController.text,
      'studentName': _studentNameController.text,
      'pinNumber': _pinNumberController.text,
      'mobileNumber': _mobileNumberController.text,
      'branch': _branchController.text,
      'semester': _semesterController.text,
      'password': _passwordController.text,
    };

    // Add the user data to Firestore
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
     FirebaseFirestore.instance
      .collection('users')
      .doc(_emailController.text)
      .set(userData)
      .then((value) {
        print("User added");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Registration successful"),
              content: Text("successfully registered!"),
              actions: <Widget>[
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      })
      .catchError((error) => print("Failed to add user: $error"));
   }, child:  Text("Register")),

        ],
      ),),
    );
  }
}