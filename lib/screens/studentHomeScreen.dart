
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dcmeapp/screens/Fac_login_page.dart';
import 'package:dcmeapp/screens/NewHomePage.dart';
import 'package:dcmeapp/screens/Notifications.dart';
import 'package:dcmeapp/screens/aboutPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dcmeapp/screens/attendence_scr.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class MyAppStu extends StatefulWidget {
   final String name;
   final String email;
   final String pinNumber;
   final String mobileNumber;
   final String className;
   final String branchName;
    
  MyAppStu({
    required this.name,
    required this.email,
    required this.pinNumber,
    required this.mobileNumber,
    required this.className,
    required this.branchName,
  });
  @override
 _MyAppState createState() => _MyAppState(name:name, email: email,pinNumber:pinNumber,mobileNumber:mobileNumber,className:className,branchName:branchName);
  
}

class _MyAppState extends State<MyAppStu> {
   String email;
  
  String name;
  
  var branchName;
  
  String className;
  
  String mobileNumber;
  
  String pinNumber;

  _MyAppState({
    required this.email, required this.name, required this.branchName, required this.className, required this.pinNumber, required this.mobileNumber,
  });
  int _selectedIndex = 0;
 void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
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
  @override
  Widget build(BuildContext context) {
   
  final List<Widget> _pages = [    HomePage(name: name,),    ResultsPage( email:email),    AttendancePage(email: email,), TimeTable(),  
  ProfilePage(branchName: branchName, mobileNumber: mobileNumber, pinNumber: pinNumber, className: className, name: name, email: email,),  ];

  

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
  child:
      Scaffold(
       
        appBar: AppBar(
          title: Text(name),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.vertical(
          //     bottom: Radius.circular(30),
          //   ),
          // ),
          actions: [
            ElevatedButton(onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>NotificationPage()));
                      },  child:  Icon(Icons.notifications),),
           
            SizedBox(width: 15,),
          ],
        ),
         drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
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
        body: _pages[_selectedIndex],
         bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blue,
        selectedLabelStyle: TextStyle(color: Colors.green),
        unselectedLabelStyle: TextStyle(color: Colors.blue),
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Results',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Time table',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          
        ],
        
        
      ),
      
      ), 
    );
  }
}



class HomePage extends StatelessWidget {
  var name;
  HomePage({
    required this.name,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                items: [
                  Image.asset('assets/images/main2.png'),
                  Image.asset('assets/images/main2.png'),
                  Image.asset('assets/images/main2.png'),
                ],
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Welcome to our college app!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              
              
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Our college app provides a variety of features for both students and faculty members, including:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Receive important notifications and announcements'),
                    ),
                    ListTile(
                      leading: Icon(Icons.schedule),
                      title: Text('View the time table and important dates'),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('View  personal information of student'),
                    ),
                    ListTile(
                      leading: Icon(Icons.book),
                      title: Text('View semester wise marks of the student'),
                    ),
                    ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text('View overall and monthly attendence'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
  }
}

class TimeTable extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          SizedBox(height:10),
          Text("TIME TABLE", style: TextStyle(fontSize: 40),),
          SizedBox(height:30,),
          Image.asset("assets/images/timetable.png"),
        ],
      )
    );
  }
}

class ResultsPage extends StatefulWidget {
  var email;
  ResultsPage({
    
    required this.email,
    
  });
  @override
  _ResultsPageState createState() => _ResultsPageState( email:email);
}

class _ResultsPageState extends State<ResultsPage> {
  var email;
  _ResultsPageState({
    required this.email,
  });
  var dropdownValue="select";

  Future<DocumentSnapshot<Object?>> getUserDetails() async {
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('marks');
    // Fetch user details from Firestore
    return await usersCollection.doc(email).get();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child:
    Column(
      children: [
        SizedBox(height: 20,),
         Text("Student results", style: TextStyle(fontSize: 30),),
        SizedBox(height: 20,),
        Text("Please select the semester " ,style: TextStyle(fontSize: 20),),
        SizedBox(height: 10,),
        Container(
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
                dropdownValue = newValue!;
              });
            },
          ),
        ),
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



        ],),
      );
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
  _AttendancePageState createState() => _AttendancePageState(email: email);
}

class _AttendancePageState extends State<AttendancePage> {
  var email;

_AttendancePageState({
   required this.email,
});
var total = 0;
var jan = 0;
var feb = 0;
var mar = 0;
var apr = 0;
var may = 0;


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
    } else {
      print('No attendance data found for this user.');
    }
  }
    
  

  @override
  void initState() {
    super.initState();
    getAttendanceData();
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
                color: Color.fromARGB(255, 205, 196, 196),
              ),
              margin: const EdgeInsets.only(bottom: 16.0),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: 1100.0,
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
                                      radius: 8.0,
                                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    Text(
                                      ' ATTENDED',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 8.0,
                                      backgroundColor:Colors.red.shade200,
                                    ),
                                    
                                    Text(
                                      ' ABSENT',
                                      style: TextStyle(fontSize: 17),
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

//Costom CLipper class with Path
class WaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height); //start path with this if you are making at bottom
    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(firstStart.dx, firstStart.dy,
        firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.width / 3.24),
        size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(secondStart.dx, secondStart.dy,
        secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}

class ProfilePage extends StatelessWidget {
  final String name;
  final String email;
  final String pinNumber;
  final String mobileNumber;
  final String className;
  final String branchName;

  ProfilePage({
    required this.name,
    required this.email,
    required this.pinNumber,
    required this.mobileNumber,
    required this.className,
    required this.branchName,
  });

  @override
  Widget build(BuildContext context) {
    return 
    SingleChildScrollView(
     
      child:
    Container(
       width: double.infinity,
      // margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 255, 252, 252),
            // blurRadius: 5,
            // offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox( height:250,
          child :Container(
             decoration: BoxDecoration(
              color: Colors.green,
              // border: Border.all(style: BorderStyle.solid),
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30))
            ),
            
            padding: const EdgeInsets.all(16),
            
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                CircleAvatar(
                  radius: 60,
                child: Image.asset('assets/images/avatar.png'),                ),
                const SizedBox(width: 46),
                Center(child :Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     SizedBox(height:80),
                     SizedBox(width:130,child: Text(
                        name,
                        style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),
                      ),),
                       
                    
                    const SizedBox(height: 8),
                    Text(
                      pinNumber,
                      style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),
                    ),
                  ],
                  
                ),),
                
                
              ],
              
            ),
          ),),
          const SizedBox(height: 16),
          Container(
           
            margin: const EdgeInsets.symmetric(horizontal: 16),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Semester',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$className SEM',
                  style: TextStyle(fontSize: 30)
                  
                ),
               
               Row(
  children: [
    Expanded(
      child: Divider(
        thickness: 2,
        color: Colors.grey[400],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(
        Icons.lock,
        color: Colors.grey[400],
        size: 28.0,
      ),
    ),
  ],
),
                Text(
                  'Academic Year',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '2020 - 2023',
                   style: TextStyle(fontSize: 30)
                ),
                
                               Row(
  children: [
    Expanded(
      child: Divider(
        thickness: 2,
        color: Colors.grey[400],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(
        Icons.lock,
        color: Colors.grey[400],
        size: 28.0,
      ),
    ),
  ],
),
                
                Text(
                  'Gmail',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  email,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                              Row(
  children: [
    Expanded(
      child: Divider(
        thickness: 2,
        color: Colors.grey[400],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(
        Icons.lock,
        color: Colors.grey[400],
        size: 28.0,
      ),
    ),
  ],
),
               
                Text(
                  'Phone Number',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  mobileNumber,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
               
                               Row(
  children: [
    Expanded(
      child: Divider(
        thickness: 2,
        color: Colors.grey[400],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(
        Icons.lock,
        color: Colors.grey[400],
        size: 28.0,
      ),
    ),
  ],
),
                
                Text(
                  'Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'ADDRESS',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Row(
  children: [
    Expanded(
      child: Divider(
        thickness: 2,
        color: Colors.grey[400],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(
        Icons.lock,
        color: Colors.grey[400],
        size: 28.0,
      ),
    ),
  ],
),
              ],
            ),
          ),
          
          ],
          
        ),
        
    ),);
  }
}
