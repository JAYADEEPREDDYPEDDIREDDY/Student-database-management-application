import 'package:dcmeapp/screens/NewHomePage.dart';
import 'package:dcmeapp/screens/getStartedPage.dart';
import 'package:dcmeapp/screens/getstart.dart';
import 'package:dcmeapp/screens/login_page.dart';
import 'package:flutter/material.dart';

class getStartedPage1 extends StatelessWidget {
  const getStartedPage1({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 184, 172, 172),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                   Image.asset('assets/images/letget.png'),
                  Positioned(
                   bottom: 0, 
                    child: Text(
                      "Let's Get Started",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -17,
                    left: 10,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.black,
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  iconSize: 50,
                  onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewHomePage(key: Key(""),),
                          ),
                        );
                  },
                  icon: Icon(Icons.arrow_back_sharp),
                ),
                SizedBox(width: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        // Handle dot 1 tap
                        // Example navigation:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => getStartedPage1(),
                          ),
                        );
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        // Handle dot 2 tap
                        // Example navigation:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => getStarted2(),
                          ),
                        );
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        // Handle dot 3 tap
                        // Example navigation:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => getStarted(),
                          ),
                        );
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 65),
               Container(
                  child: SingleChildScrollView(child: IconButton(
                 

                  iconSize: 40, // Increase the size of the icon
                  style: ButtonStyle(
                   
                     // Increase the size of the icon
                  ),
                  onPressed: () {
                   Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => getStarted2(),
                          ),
                        );
                  },
                  icon: Icon(Icons.arrow_forward_sharp),
                ),)
                   
                ),
               
              ],
            ),
          ],
        ),
      ),
    );
  }
}
