import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddAttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AddAttendancePage> {
  final TextEditingController _attendanceController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _selectedMonth = 'jan';
  int _totalAttendance = 0;
   List<Map<String, dynamic>> documents = [];
   
     var matchingDocumentId;
 Future<void> fetchDocuments(String collectionName) async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(collectionName).get();

    setState(() {
      documents = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  var email="student@gmail.com";
 

  void submit() {
    String enteredPinNumber = _pinController.text;
    // Loop through all the documents and compare the entered pin number with the one stored in the document
    for (var doc in documents) {
      print(doc['pinNumber']);
      if (doc['pinNumber'] == enteredPinNumber) {
        print(doc['pinNumber']);
        setState(() {
          matchingDocumentId = doc['documentId'];
          email = doc['email'];
          print(email);
        });
        break; // Stop the loop if there is a match
      }
    }
  }
  void _addAttendance() async {
  final String attendance = _attendanceController.text;
  _attendanceController.clear();

  final DocumentReference monthDocument = _firestore
      .collection('attedence')
      .doc(email);

  final DocumentSnapshot snapshot = await monthDocument.get();

  if (snapshot.exists) {
    final Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    if (data != null) {
      if (data.containsKey(_selectedMonth)) {
        int previousAttendance=0;
        await monthDocument.update({
          _selectedMonth: previousAttendance + int.parse(attendance),
        });
        setState(() {
          _totalAttendance += int.parse(attendance);
        });
      } else {
        data[_selectedMonth] = int.parse(attendance);
        await monthDocument.set(data);
        setState(() {
          _totalAttendance += int.parse(attendance);
        });
      }
    }
  } else {
    await monthDocument.set({
      _selectedMonth: int.parse(attendance),
    });
    setState(() {
      _totalAttendance += int.parse(attendance);
    });
  }
}



 @override
  void initState() {
    super.initState();
    fetchDocuments('users'); // Replace 'collectionName' with the actual name of your collection
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  "Please enter Pin number",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _pinController,
                decoration: InputDecoration(
                  labelText: 'PIN NUMBER',
                ),
              ),
            ),
            DropdownButton<String>(
              value: _selectedMonth,
              
              items: <String>[
                'jan',
                'feb',
                'mar',
                'apr',
                'may',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  submit();
                  _selectedMonth = newValue!;
                });
              },
            ),
            SizedBox(height: 16.0),
            
            SizedBox(height: 16.0),
            TextField(
              controller: _attendanceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Attendance',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addAttendance,
              child: Text('Add Attendance'),
            ),
          ],
        ),
      ),
    );
  }
}
