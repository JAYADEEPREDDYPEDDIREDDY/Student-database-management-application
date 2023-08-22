import 'package:dcmeapp/screens/Fac_login_page.dart';
import 'package:dcmeapp/screens/NewHomePage.dart';
import 'package:dcmeapp/screens/aboutPage.dart';
import 'package:dcmeapp/screens/appBar.dart';


import 'package:dcmeapp/screens/login_page.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Help"),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Help',
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
                                builder: (context) =>AboutPage()));
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

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Q: How do I reset my password?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'A: To reset your password, click on the "Forgot Password?" button on the login screen and follow the instructions.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Q: How do I contact customer support?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'A: To contact customer support, send an email to support@myapp.com.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
