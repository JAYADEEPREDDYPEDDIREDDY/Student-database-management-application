import 'package:dcmeapp/screens/Fac_login_page.dart';
import 'package:dcmeapp/screens/NewHomePage.dart';
import 'package:dcmeapp/screens/appBar.dart';
import 'package:dcmeapp/screens/helpPage.dart';

import 'package:dcmeapp/screens/imagePicker.dart';
import 'package:dcmeapp/screens/login_page.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "About"),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'About',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.home),
                    Text('  Home'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewHomePage(key: Key(""),)));
                },
              ),
              
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.person),
                    Text('  Student Login '),
                  ],
                ),
                onTap: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                },
              ),
              ListTile(
                title: Row(
                  children: [
                      Icon(Icons.lock),
                    Text('  Faculty Login'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Fac_login_page()));
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.people),
                    Text('  Faculty'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HelpPage()));
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.photo_album),
                    Text('  Gallary'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>GalleryPage()));
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.info_outline_rounded),
                    Text('  About'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>AboutPage()));
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.help),
                    Text('  help'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HelpPage()));
                },
              ),
            ],
            
          ),
        ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/main2.png', 
              height: 300,
              width: 500,
            ),
            SizedBox(height: 20),
            Text(
              'SVGP DCME',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Address: Your college address',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Phone: Your college phone number',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Email: Your college email',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'About SVGP DCME',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Here you can write a brief description of your college SVGP DCME branch, its history, academic programs, notable achievements, and other relevant information.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
