import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dcmeapp/screens/AddAttenddence.dart';
import 'package:dcmeapp/screens/NewHomePage.dart';
import 'package:dcmeapp/screens/add_marks_page.dart';
import 'package:dcmeapp/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
class FacultyPage extends StatefulWidget {
  const FacultyPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<FacultyPage> {
  int _selectedIndex = 0;
Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

       Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NewHomePage(key: Key(""),), // Replace with the actual login screen widget
        ),
      );
      // Navigate to the login screen or any other desired screen after logout
    } catch (e) {
      print('Error during sign out: $e');
    }
  }
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    TimetableScreen(),
    StudentScreen(),
    NotificationsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return 
     WillPopScope(
  onWillPop: () async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Confirmation'),
        content: Text('Are you sure you want to exit?'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          ElevatedButton(
            onPressed: () {
               Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewHomePage(key: Key(""),)));
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  },
  child :Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 200,
              child: Image.asset('assets/images/faclogin.png'),
            ),
           ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                _signOut();
                // Handle logout logic here
                // For example, you can navigate to the login screen or clear the user session.
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        backgroundColor: Colors.white,
        color: Colors.green,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.timelapse, size: 30),
          Icon(Icons.person, size: 30),
          Icon(Icons.notifications, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),),
    );
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/facLoginimg.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Bosu babu',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Container(
                      color: Colors.blue,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'ADD',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.person),
                    label: Text('Student'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddMarks(),
                        ),
                      );
                    },
                    icon: Icon(Icons.grade),
                    label: Text('Marks'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddAttendancePage(),
                        ),
                      );
                      // Navigate to ADD screen for Attendance
                    },
                    icon: Icon(Icons.calendar_today),
                    label: Text('Attendance'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Container(
                      color: Colors.blue,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'EDIT',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to EDIT screen for Student
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.person),
                    label: Text('Student'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to EDIT screen for Marks
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddMarks(),
                        ),
                      );
                    },
                    icon: Icon(Icons.grade),
                    label: Text('Marks'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to EDIT screen for Attendance
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddAttendancePage(),
                        ),
                      );
                    },
                    icon: Icon(Icons.calendar_today),
                    label: Text('Attendance'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



 class TimetableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
       
        child: 
          
        Column(
        children: [
          SizedBox(height:10),
          Text("TIME TABLE", style: TextStyle(fontSize: 40),),
          SizedBox(height:30,),
          Image.asset("assets/images/timetable.png"),
        ],
      )
    ),);
  }
}
 class StudentScreen extends StatefulWidget {
  @override
  _TogglePageState createState() => _TogglePageState();
}

class _TogglePageState extends State<StudentScreen> {
  int _currentIndex = 0;

  List<Widget> _pages = [
    ResultsPage(),
    AttendancePage(email: 'student@gmai.com',),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               
                _buildToggleButton('Results', 0),
                _buildToggleButton('Attendence', 1),
                  
            
                
              ],
            ),
          ),

          
        
          Expanded(
            child: _pages[_currentIndex],
          ),
      
        ],
      ),
    );
  }

  Widget _buildToggleButton(String label, int index) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Text(label),
      style: ElevatedButton.styleFrom(
        primary: _currentIndex == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}

class ResultsPage extends StatefulWidget {
  
 
  @override
  _ResultsPageState createState() => _ResultsPageState( );
}

class _ResultsPageState extends State<ResultsPage> {
  String? matchingDocumentId;
  List<Map<String, dynamic>> documents = [];

  Future<void> fetchDocuments(String collectionName) async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(collectionName).get();

    setState(() {
      documents = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  var email;
  final TextEditingController pinNumber1 = TextEditingController();

  void submit() {
    String enteredPinNumber = pinNumber1.text;
    // Loop through all the documents and compare the entered pin number with the one stored in the document
    for (var doc in documents) {
      print(doc['pinNumber']);
      if (doc['pinNumber'] == enteredPinNumber) {
        setState(() {
          matchingDocumentId = doc['documentId'];
          email = doc['email'];
        });
        break; // Stop the loop if there is a match
      }
    }
  }

  var dropdownValue = "select";

  Future<DocumentSnapshot<Object?>> getUserDetails() async {
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('marks');
    // Fetch user details from Firestore
    return await usersCollection.doc(email).get();
  }

  @override
  void initState() {
    super.initState();
    fetchDocuments('users'); // Replace 'collectionName' with the actual name of your collection
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView( child: 
    Column(
      children: [
        Row(
          children: [
            SizedBox(width:10),
            Text("Please enter Pin number", style: TextStyle(fontSize: 20),),
            
          ],
        ),
        Padding(padding: EdgeInsets.all(10),
          child : TextFormField(
                 
                   controller: pinNumber1,
                  decoration: InputDecoration(
                    labelText: 'PIN NUMBER',
                    
                
                    
                  ),
                  
                ),),
       
        Row(
          children: [
            Padding(padding: EdgeInsets.all(10), child: Text("Please select the semester " ,style: TextStyle(fontSize: 20)),),
          ],),
           
        
       
        Padding(padding: EdgeInsets.all(10),child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          width: 400,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: DropdownButton<String>(
            value: dropdownValue,
            items: <String>[
              'select',
              '1 year',
              '3rd sem',
              '4th sem',
              '5th sem'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              
              setState(() {
                submit();
              getUserDetails();
                print(matchingDocumentId);
                dropdownValue = newValue!;
              });
            },
            
          ),
        ),),
       
        SizedBox(height: 20),
        dropdownValue == "1 year"
            ? FutureBuilder(
                future: getUserDetails(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return DataTable(
                      columns: const <DataColumn>[
                        DataColumn(label: Text('Subject')),
                        DataColumn(label: Text('Internal')),
                        DataColumn(label: Text('External')),
                        
                      ],
                      rows: <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('ENGLISH')),
                            DataCell(Text(snapshot.data.get('101I').toString())),
                            DataCell(Text(snapshot.data.get('101E').toString())),
                           
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('MATH-I')),
                            DataCell(Text(snapshot.data.get('102I').toString())),
                            DataCell(Text(snapshot.data.get('102E').toString())),
                           
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('PHYSICS')),
                            DataCell(Text(snapshot.data.get('103I').toString())),
                            DataCell(Text(snapshot.data.get('103E').toString())),
                             
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('CHEMISTRY')),
                            DataCell(Text(snapshot.data.get('104I').toString())),
                            DataCell(Text(snapshot.data.get('104E').toString())),
                              
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('BCE')),
                            DataCell(Text(snapshot.data.get('105I').toString())),
                            DataCell(Text(snapshot.data.get('105E').toString())),
                            
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('C PROGRAMMING')),
                            DataCell(Text(snapshot.data.get('106I').toString())),
                            DataCell(Text(snapshot.data.get('106E').toString())),
                            
                            ],
                          ),
                          DataRow(
                          cells: <DataCell>[
                            DataCell(Text('PHYSICS LAB')),
                            DataCell(Text(snapshot.data.get('106I').toString())),
                            DataCell(Text(snapshot.data.get('106E').toString())),
                            
                            ],
                          ),
                          DataRow(
                          cells: <DataCell>[
                            DataCell(Text('CHEMISTRY LAB')),
                            DataCell(Text(snapshot.data.get('106I').toString())),
                            DataCell(Text(snapshot.data.get('106E').toString())),
                            
                            ],
                          ),
                          DataRow(
                          cells: <DataCell>[
                            DataCell(Text('C PROGRAMMING LAB')),
                            DataCell(Text(snapshot.data.get('106I').toString())),
                            DataCell(Text(snapshot.data.get('106E').toString())),
                            
                            ],
                          ),
                          DataRow(
                          cells: <DataCell>[
                            DataCell(Text('ENGLISH LAB')),
                            DataCell(Text(snapshot.data.get('106I').toString())),
                            DataCell(Text(snapshot.data.get('106E').toString())),
                            
                            ],
                          ),
                          DataRow(
                          cells: <DataCell>[
                            DataCell(Text('TOTAL',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataCell(Text(" "),),
                            DataCell(Text("")),
                            
                            ],
                          ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
              : SizedBox.shrink(),
              dropdownValue == "3rd sem"
              ? FutureBuilder(
                  future: getUserDetails(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return DataTable(
                        columns: const <DataColumn>[
                          DataColumn(label: Text('Subject')),
                          DataColumn(label: Text('Internal')),
                          DataColumn(label: Text('External')),
                        ],
                        rows: <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('MATH-II')),
                              DataCell(Text(snapshot.data.get('301I').toString())),
                              DataCell(Text(snapshot.data.get('301E').toString())),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('DE')),
                              DataCell(Text(snapshot.data.get('302I').toString())),
                              DataCell(Text(snapshot.data.get('302E').toString())),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('OS')),
                              DataCell(Text(snapshot.data.get('303I').toString())),
                              DataCell(Text(snapshot.data.get('303E').toString())),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('DS THROUGH C')),
                              DataCell(Text(snapshot.data.get('304I').toString())),
                              DataCell(Text(snapshot.data.get('304E').toString())),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('DBMS')),
                              DataCell(Text(snapshot.data.get('305I').toString())),
                              DataCell(Text(snapshot.data.get('305E').toString())),
                            ],
                          ),
                           DataRow(
                            cells: <DataCell>[
                              DataCell(Text('DE LAB')),
                              DataCell(Text(snapshot.data.get('305I').toString())),
                              DataCell(Text(snapshot.data.get('305E').toString())),
                            ],
                          ),
                           DataRow(
                            cells: <DataCell>[
                              DataCell(Text('DS KAB')),
                              DataCell(Text(snapshot.data.get('305I').toString())),
                              DataCell(Text(snapshot.data.get('305E').toString())),
                            ],
                          ),
                           DataRow(
                            cells: <DataCell>[
                              DataCell(Text('DBMS LAB')),
                              DataCell(Text(snapshot.data.get('305I').toString())),
                              DataCell(Text(snapshot.data.get('305E').toString())),
                            ],
                          ),
                           DataRow(
                            cells: <DataCell>[
                              DataCell(Text('MULTIMEDIA LAB')),
                              DataCell(Text(snapshot.data.get('305I').toString())),
                              DataCell(Text(snapshot.data.get('305E').toString())),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
              : SizedBox.shrink(),
              dropdownValue == "4th sem"
              ? FutureBuilder(
                  future: getUserDetails(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return DataTable(
                        columns: const <DataColumn>[
                          DataColumn(label: Text('Subject')),
                          DataColumn(label: Text('Internal')),
                          DataColumn(label: Text('External')),
                        ],
                        rows: <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('MATHS-III')),
                              DataCell(Text(snapshot.data.get('401I').toString())),
                              DataCell(Text(snapshot.data.get('401E').toString())),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('WT')),
                              DataCell(Text(snapshot.data.get('402I').toString())),
                              DataCell(Text(snapshot.data.get('402E').toString())),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('CO&MP')),
                              DataCell(Text(snapshot.data.get('403I').toString())),
                              DataCell(Text(snapshot.data.get('403E').toString())),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('OOPS THROUGH C++')),
                              DataCell(Text(snapshot.data.get('404I').toString())),
                              DataCell(Text(snapshot.data.get('404E').toString())),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('CN')),
                              DataCell(Text(snapshot.data.get('405I').toString())),
                              DataCell(Text(snapshot.data.get('405E').toString())),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('WT LAB')),
                              DataCell(Text(snapshot.data.get('405I').toString())),
                              DataCell(Text(snapshot.data.get('405E').toString())),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('C++ LAB')),
                              DataCell(Text(snapshot.data.get('405I').toString())),
                              DataCell(Text(snapshot.data.get('405E').toString())),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('COMMUNICATIONAL SKILLS')),
                              DataCell(Text(snapshot.data.get('405I').toString())),
                              DataCell(Text(snapshot.data.get('405E').toString())),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('CH&NM LAB')),
                              DataCell(Text(snapshot.data.get('405I').toString())),
                              DataCell(Text(snapshot.data.get('405E').toString())),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
              : SizedBox.shrink(),
             
dropdownValue == "5th sem"
    ? FutureBuilder(
        future: getUserDetails(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data.data();
            if (data.containsKey('501I') &&
                data.containsKey('501E') &&
                data.containsKey('502I') &&
                data.containsKey('502E') &&
                data.containsKey('503I') &&
                data.containsKey('503E') &&
                data.containsKey('504I') &&
                data.containsKey('504E') &&
                data.containsKey('505I') &&
                data.containsKey('505E')) {
              return DataTable(
                columns: const <DataColumn>[
                  DataColumn(label: Text('Subject')),
                  DataColumn(label: Text('Internal')),
                  DataColumn(label: Text('External')),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('')),
                      DataCell(Text(data['501I'].toString())),
                      DataCell(Text(data['501E'].toString())),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('502')),
                      DataCell(Text(data['502I'].toString())),
                      DataCell(Text(data['502E'].toString())),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('503')),
                      DataCell(Text(data['503I'].toString())),
                      DataCell(Text(data['503E'].toString())),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('504')),
                      DataCell(Text(data['504I'].toString())),
                      DataCell(Text(data['504E'].toString())),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('505')),
                      DataCell(Text(data['505I'].toString())),
                      DataCell(Text(data['505E'].toString())),
                    ],
                  ),
                ],
              );
            } else {
              return Text('Data not found');
            }
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error.toString()}');
          } else {
            return CircularProgressIndicator();
          }
                  },
                )
              : SizedBox.shrink(),



        ],
      ),);
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class AttendancePage extends StatefulWidget {
  final String email;

  const AttendancePage({Key? key, required this.email}) : super(key: key);

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
 
  var total = 0;
  var jan = 0;
  var feb = 0;
  var mar = 0;
  var apr = 0;
  var may = 0;
   String? matchingDocumentId;
  List<Map<String, dynamic>> documents = [];

  Future<void> fetchDocuments(String collectionName) async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(collectionName).get();

    setState(() {
      documents = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  } 

  var email;
  final TextEditingController pinNumber1 = TextEditingController();

  void submit() {
    String enteredPinNumber = pinNumber1.text;
    // Loop through all the documents and compare the entered pin number with the one stored in the document
    for (var doc in documents) {
      print(doc['pinNumber']);
      if (doc['pinNumber'] == enteredPinNumber) {
        setState(() {
          matchingDocumentId = doc['documentId'];
          email = doc['email'];
        });
        break; // Stop the loop if there is a match
      }
    }
  }

  
  Future<void> getAttendanceData() async {
    final CollectionReference attendanceCollection =
        FirebaseFirestore.instance.collection('attedence');

    DocumentSnapshot attendanceDoc =
        await attendanceCollection.doc(email).get();

    if (attendanceDoc.exists) {
      setState(() {
        total = (attendanceDoc['total']);
        jan = (attendanceDoc['jan']);
        feb = (attendanceDoc['feb']);
        mar = (attendanceDoc['mar']);
        apr = (attendanceDoc['apr']);
        may = (attendanceDoc['may']);
      });

      await fetchDocuments('users'); // Replace 'collectionName' with the actual name of your collection
      submit();
    } else {
      print('No attendance data found for this user.');
    }
  }

 

  @override
  void initState() {
    super.initState();
    fetchDocuments("users");
  }


  @override
  Widget build(BuildContext context) {
     getAttendanceData();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
          children: [
            SizedBox(width:10),
            Text("Please enter Pin number", style: TextStyle(fontSize: 20),),
            
          ],
        ),
        Padding(padding: EdgeInsets.all(10),
          child : TextFormField(
                 
                   controller: pinNumber1,
                  decoration: InputDecoration(
                    labelText: 'PIN NUMBER',
                    
                
                    
                  ),
                  
                ),),
                ElevatedButton(onPressed: (){
                 setState(() {
                   submit();
                   print(email);
                   getAttendanceData();
                 });
                }, child: Text("Submit")),
            Center(
              child: Text(
                'Attendance',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.grey[200],
              ),
              margin: const EdgeInsets.only(bottom: 16.0),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: 1000.0,
                    height: 150.0,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            CircularPercentIndicator(
                              radius: 130,
                              lineWidth: 10,
                              percent: total / 100,
                              progressColor: Colors.white,
                              backgroundColor: Colors.red.shade200,
                              circularStrokeCap: CircularStrokeCap.round,
                              center: Text(
                                '$total%',
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              height: 50,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 9.0,
                                      backgroundColor: Colors.grey,
                                    ),
                                    Text(
                                      ' ATTENDED',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 9.0,
                                      backgroundColor: Colors.grey,
                                    ),
                                    Text(
                                      ' ABSENT',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'Monthly Attendance',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text("    JAN", style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.grey[200],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  LinearPercentIndicator(
                        lineHeight: 25,
                        percent: total/100,
                        progressColor: Colors.deepPurple,
                        
                    backgroundColor: Colors.deepPurple.shade100,
                    center: Text(jan.toString(),style: TextStyle(color: Colors.white),),
                    
                    ),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Text("    FEB", style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.grey[200],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  LinearPercentIndicator(
                        lineHeight: 25,
                        percent: feb/100,
                        progressColor: Colors.deepPurple,
                        
                    backgroundColor: Colors.deepPurple.shade100,
                    center: Text(feb.toString(),style: TextStyle(color: Colors.white),),
                    
                    ),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Text("    MAR", style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.grey[200],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  LinearPercentIndicator(
                        lineHeight: 25,
                        percent: mar/100,
                        progressColor: Colors.deepPurple,
                        
                    backgroundColor: Colors.deepPurple.shade100,
                    center: Text(mar.toString(),style: TextStyle(color: Colors.white),),
                    
                    ),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Text("    APR", style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.grey[200],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  LinearPercentIndicator(
                        lineHeight: 25,
                        percent: apr/100,
                        progressColor: Colors.deepPurple,
                        
                    backgroundColor: Colors.deepPurple.shade100,
                    center: Text(apr.toString(),style: TextStyle(color: Colors.white),),
                    
                    ),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
          ],
        ),
      ),);
  }
}



class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'New Notifications',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          _buildNotificationCard(
            title: 'Upcoming Exam',
            message:
                'There will be an exam on Monday. Please make sure you have studied and are prepared.',
          ),
          SizedBox(height: 10),
          _buildNotificationCard(
            title: 'Faculty Meeting',
            message:
                'There will be a faculty meeting on Wednesday to discuss the upcoming semester. Please make sure you attend.',
          ),
          SizedBox(height: 10),
          _buildNotificationCard(
            title: 'Holiday Notice',
            message:
                'The college will be closed on Friday for a holiday. Please enjoy your day off!',
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard({required String title, required String message}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            message,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          
        ],
      ),
    );
  }
}

