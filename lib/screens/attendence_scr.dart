import "package:flutter/material.dart";

class Attendance extends StatelessWidget {
  const Attendance({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(appBar: AppBar(
        title: Title(color: Colors.black,
        child: const Text("Attendence")),
        leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon:Icon(Icons.arrow_back_ios), 
      
      //replace with our own icon data.
  )
      ),);
    
  }
}