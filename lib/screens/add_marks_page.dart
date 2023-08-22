import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class AddMarks extends StatefulWidget {
  
 
  @override
  _AddMarksState createState() => _AddMarksState( );
}

class _AddMarksState extends State<AddMarks> {
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
Map<String, dynamic> editedMarks = {};
void submitMarks() async {
  print(matchingDocumentId);
  if (matchingDocumentId == null) {
    final CollectionReference marksCollection =
        FirebaseFirestore.instance.collection('marks');
    await marksCollection.doc(email).update(editedMarks);
    print('Marks updated successfully');
  } else {
    print('No matching document found');
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
    return  Scaffold(
      appBar: AppBar(title: Text("EDIT MARKS"),),
      body: SingleChildScrollView( child: 
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
    DataCell(TextFormField(
      initialValue: snapshot.data.get('101I').toString(),
      onChanged: (value) {
        editedMarks['101I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('101E').toString(),
      onChanged: (value) {
        editedMarks['101E'] = value;
      },
    )),
  ],
),
                         DataRow(
  cells: <DataCell>[
    DataCell(Text('MATHS-I')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('102I').toString(),
      onChanged: (value) {
        editedMarks['102I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('102E').toString(),
      onChanged: (value) {
        editedMarks['102E'] = value;
      },
    )),
  ],
),
                        DataRow(
  cells: <DataCell>[
    DataCell(Text('PHYSICS')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('103I').toString(),
      onChanged: (value) {
        editedMarks['103I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('103E').toString(),
      onChanged: (value) {
        editedMarks['103E'] = value;
      },
    )),
  ],
),
                         DataRow(
  cells: <DataCell>[
    DataCell(Text('CHEMISTRY')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('104I').toString(),
      onChanged: (value) {
        editedMarks['104I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('104E').toString(),
      onChanged: (value) {
        editedMarks['104E'] = value;
      },
    )),
  ],
),
                         DataRow(
  cells: <DataCell>[
    DataCell(Text('C PROGRAMMING')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('105I').toString(),
      onChanged: (value) {
        editedMarks['105I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('105E').toString(),
      onChanged: (value) {
        editedMarks['105E'] = value;
      },
    )),
  ],
),
 DataRow(
  cells: <DataCell>[
    DataCell(Text('BCE')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('106I').toString(),
      onChanged: (value) {
        editedMarks['106I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('106E').toString(),
      onChanged: (value) {
        editedMarks['106E'] = value;
      },
    )),
  ],
),
                         DataRow(
  cells: <DataCell>[
    DataCell(Text('ENGINEERING DRAWING')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('106I').toString(),
      onChanged: (value) {
        editedMarks['106I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('106E').toString(),
      onChanged: (value) {
        editedMarks['106E'] = value;
      },
    )),
  ],
),
                          DataRow(
  cells: <DataCell>[
    DataCell(Text('C LAB')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('106I').toString(),
      onChanged: (value) {
        editedMarks['106I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('106E').toString(),
      onChanged: (value) {
        editedMarks['106E'] = value;
      },
    )),
  ],
),
                          DataRow(
  cells: <DataCell>[
    DataCell(Text('PHYSICS LAB')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('106I').toString(),
      onChanged: (value) {
        editedMarks['106I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('106E').toString(),
      onChanged: (value) {
        editedMarks['106E'] = value;
      },
    )),
  ],
),
 DataRow(
  cells: <DataCell>[
    DataCell(Text('CHEMISTRY LAB')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('106I').toString(),
      onChanged: (value) {
        editedMarks['106I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('106E').toString(),
      onChanged: (value) {
        editedMarks['106E'] = value;
      },
    )),
  ],
),
 DataRow(
  cells: <DataCell>[
    DataCell(Text('COMPUTER FUNDAMENTAL LAB')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('106I').toString(),
      onChanged: (value) {
        editedMarks['106I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('106E').toString(),
      onChanged: (value) {
        editedMarks['106E'] = value;
      },
    )),
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
    DataCell(Text('MATHS-II')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('301I').toString(),
      onChanged: (value) {
        editedMarks['301I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('301E').toString(),
      onChanged: (value) {
        editedMarks['301E'] = value;
      },
    )),
  ],
), DataRow(
  cells: <DataCell>[
    DataCell(Text('WT')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('302I').toString(),
      onChanged: (value) {
        editedMarks['302I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('302E').toString(),
      onChanged: (value) {
        editedMarks['302E'] = value;
      },
    )),
  ],
),
                          DataRow(
  cells: <DataCell>[
    DataCell(Text('CO&MP')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('303I').toString(),
      onChanged: (value) {
        editedMarks['303I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('303E').toString(),
      onChanged: (value) {
        editedMarks['303E'] = value;
      },
    )),
  ],
),
                          DataRow(
  cells: <DataCell>[
    DataCell(Text('OOPS THROUGH C++')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('304I').toString(),
      onChanged: (value) {
        editedMarks['304I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('304E').toString(),
      onChanged: (value) {
        editedMarks['304E'] = value;
      },
    )),
  ],
),
                          DataRow(
  cells: <DataCell>[
    DataCell(Text('CN')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('304I').toString(),
      onChanged: (value) {
        editedMarks['304I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('305E').toString(),
      onChanged: (value) {
        editedMarks['305E'] = value;
      },
    )),
  ],
),
                           DataRow(
  cells: <DataCell>[
    DataCell(Text('WT LAB')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('304I').toString(),
      onChanged: (value) {
        editedMarks['304I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('305E').toString(),
      onChanged: (value) {
        editedMarks['305E'] = value;
      },
    )),
  ],
),
                            DataRow(
  cells: <DataCell>[
    DataCell(Text('C++ LAB')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('304I').toString(),
      onChanged: (value) {
        editedMarks['304I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('305E').toString(),
      onChanged: (value) {
        editedMarks['305E'] = value;
      },
    )),
  ],
),
                           DataRow(
  cells: <DataCell>[
    DataCell(Text('COMMUNCATIONAL SKILLS LAB')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('304I').toString(),
      onChanged: (value) {
        editedMarks['304I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('305E').toString(),
      onChanged: (value) {
        editedMarks['305E'] = value;
      },
    )),
  ],
),
                            DataRow(
  cells: <DataCell>[
    DataCell(Text('CH&NM LAB')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('304I').toString(),
      onChanged: (value) {
        editedMarks['304I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('305E').toString(),
      onChanged: (value) {
        editedMarks['305E'] = value;
      },
    )),
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
    DataCell(TextFormField(
      initialValue: snapshot.data.get('401I').toString(),
      onChanged: (value) {
        editedMarks['401I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('401E').toString(),
      onChanged: (value) {
        editedMarks['401E'] = value;
      },
    )),
  ],
), DataRow(
  cells: <DataCell>[
    DataCell(Text('WT')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('402I').toString(),
      onChanged: (value) {
        editedMarks['402I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('402E').toString(),
      onChanged: (value) {
        editedMarks['402E'] = value;
      },
    )),
  ],
),
                          DataRow(
  cells: <DataCell>[
    DataCell(Text('CO&MP')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('403I').toString(),
      onChanged: (value) {
        editedMarks['403I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('403E').toString(),
      onChanged: (value) {
        editedMarks['403E'] = value;
      },
    )),
  ],
),
                          DataRow(
  cells: <DataCell>[
    DataCell(Text('OOPS THROUGH C++')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('404I').toString(),
      onChanged: (value) {
        editedMarks['404I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('404E').toString(),
      onChanged: (value) {
        editedMarks['404E'] = value;
      },
    )),
  ],
),
                          DataRow(
  cells: <DataCell>[
    DataCell(Text('CN')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('405I').toString(),
      onChanged: (value) {
        editedMarks['405I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('405E').toString(),
      onChanged: (value) {
        editedMarks['405E'] = value;
      },
    )),
  ],
),
                           DataRow(
  cells: <DataCell>[
    DataCell(Text('WT LAB')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('405I').toString(),
      onChanged: (value) {
        editedMarks['405I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('405E').toString(),
      onChanged: (value) {
        editedMarks['405E'] = value;
      },
    )),
  ],
),
                            DataRow(
  cells: <DataCell>[
    DataCell(Text('C++ LAB')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('405I').toString(),
      onChanged: (value) {
        editedMarks['405'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('405E').toString(),
      onChanged: (value) {
        editedMarks['405E'] = value;
      },
    )),
  ],
),
                           DataRow(
  cells: <DataCell>[
    DataCell(Text('COMMUNCATIONAL SKILLS LAB')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('404I').toString(),
      onChanged: (value) {
        editedMarks['404I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('404E').toString(),
      onChanged: (value) {
        editedMarks['404E'] = value;
      },
    )),
  ],
),
                            DataRow(
  cells: <DataCell>[
    DataCell(Text('CH&NM LAB')),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('404I').toString(),
      onChanged: (value) {
        editedMarks['404I'] = value;
      },
    )),
    DataCell(TextFormField(
      initialValue: snapshot.data.get('404E').toString(),
      onChanged: (value) {
        editedMarks['404E'] = value;
      },
    )),
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

ElevatedButton(
  onPressed: () {
    submit();
    submitMarks();
  },
  child: Text('Submit'),
),


        ],
        
    ),
    
    ),);
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}