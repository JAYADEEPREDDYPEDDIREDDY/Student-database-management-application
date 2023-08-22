import 'package:dcmeapp/screens/FacHomePage.dart';
import 'package:dcmeapp/screens/NewHomePage.dart';
import 'package:dcmeapp/screens/aboutPage.dart';
import 'package:dcmeapp/screens/appBar.dart';
import 'package:dcmeapp/screens/helpPage.dart';
import 'package:dcmeapp/screens/imagePicker.dart';
import 'package:dcmeapp/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Fac_login_page extends StatefulWidget {
  const Fac_login_page({super.key});

  @override
  _fac_LoginPageState createState() => _fac_LoginPageState();
}

class _fac_LoginPageState extends State<Fac_login_page> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late String _email, _password;
  bool _isLoading = false;
  
  bool passwordVisible=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Faculty Login"),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Home',
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

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          
          
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                Image.asset(
                  "assets/images/facLoginimg.png",
                  width: 600,
                  height: 410,
                ),
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Please enter an email';
                      }
                      return null;
                    },
                    onSaved: (input) => _email = input!,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    obscureText: passwordVisible,
                    controller: _passwordController,
                    validator: (input) {
                      if (input!.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    onSaved: (input) => _password = input!,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    
                   helperStyle:TextStyle(color:Colors.green),
                   suffixIcon: IconButton(
                     icon: Icon(passwordVisible
                         ? Icons.visibility
                         : Icons.visibility_off),
                     onPressed: () {
                       setState(
                         () {
                           passwordVisible = !passwordVisible;
                         },
                       );
                     },
                   ),
                   alignLabelWithHint: false,
                   filled: true,
                 ),
                 keyboardType: TextInputType.visiblePassword,
                 textInputAction: TextInputAction.done,
                  ),
                 
                ),
                SizedBox(height: 20),
                _isLoading
                    ? CircularProgressIndicator()
                    : Container(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            _signIn();
                          },
                          child: Text(
                            'LOGIN',
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
              GestureDetector(
                onTap: _forgotPassword,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
void _forgotPassword() async {
  if (_emailController.text.isNotEmpty) {
    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text);
      _showSuccessDialog('Password reset email sent. Check your inbox.');
    } catch (e) {
      print(e);
      _showErrorDialog('An error occurred. Please try again later.');
    }
  } else {
    _showErrorDialog('Please enter your email to reset password.');
  }
}
void _showSuccessDialog(String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Success'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
  void _signIn() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  FacultyPage()),
            );
      } on FirebaseAuthException catch (e) {
        setState(() {
          _isLoading = false;
        });
        if (e.code == 'user-not-found') {
          _showErrorDialog('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          _showErrorDialog('Wrong password provided for that user.');
        } else {
          _showErrorDialog('An error occurred. Please try again later.');
        }
      } catch (e) {
        print(e);
      }
    }
  }
void _showErrorDialog(String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
  }   