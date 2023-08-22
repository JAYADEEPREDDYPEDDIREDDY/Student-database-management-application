import 'package:dcmeapp/screens/FacHomePage.dart';
import 'package:dcmeapp/screens/Fac_login_page.dart';
import 'package:dcmeapp/screens/getStartedPage1.dart';
import 'package:dcmeapp/screens/studentHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NewHomePage extends StatefulWidget {
  const NewHomePage({required Key key}) : super(key: key);

  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoggedIn = false; // Variable to track the login state

  @override
  void initState() {
    super.initState();
    checkLoginStatus(); // Check the login status when the app starts or resumes
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool('loggedIn') ?? false; // Read the login state from shared preferences
    if (loggedIn) {
      // User is already logged in
      setState(() {
        isLoggedIn = true;
      });
    }
  }

  Future<void> loginUser() async {
    try {
      // Perform the login process using Firebase Authentication
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: 'example@email.com',
        password: 'password',
      );

      // Store the login state in shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('loggedIn', true);

      setState(() {
        isLoggedIn = true;
      });
    } catch (e) {
      print('Login error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Image.asset("assets/images/HomeScreen.png"),
            Text(
              "WELCOME TO DCME",
              style: TextStyle(
                  color: Color.fromARGB(255, 197, 183, 183),
                  fontStyle: FontStyle.normal,
                  fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(padding: EdgeInsets.all(10), child: 
            SizedBox(
              width: 350,
              height: 50,
               
              child: isLoggedIn
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAppStu(branchName: '', className: '', mobileNumber: '', email: '', name: '', pinNumber: '',)),
                  );
                      },
                      child: const Text(
                        "STUDENT LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {
                         Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => getStartedPage1()),
                  );
                      // Perform the login process
                      },
                      child: const Text(
                        "STUDENT LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),),
            SizedBox(
              height: 20,
            ),
            Padding(padding: EdgeInsets.all(10),child:
            SizedBox(
              width: 350,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Fac_login_page()),
                  );
                },
                child: Text(
                  "FACULTY LOGIN",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ), ),
          ],
        ),
      ),
    );
  }
}
