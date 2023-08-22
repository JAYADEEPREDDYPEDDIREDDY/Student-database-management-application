import 'package:flutter/material.dart';

class Faculty {
  final String name;
  final String role;
  final String photoUrl;

  Faculty({required this.name, required this.role, required this.photoUrl});
}

class FacultyScreen extends StatelessWidget {
  final List<Faculty> faculties = [
    Faculty(
        name: 'Name',
        role: 'Professor',
        photoUrl:
            'https://via.placeholder.com/150/0000FF/808080%20?Text=Digital.com'),
    Faculty(
        name: 'Name',
        role: 'Assistant Professor',
        photoUrl:
            'https://via.placeholder.com/150/FF0000/FFFFFF%20?Text=Digital.com'),
    Faculty(
        name: 'Name',
        role: 'Teaching Assistant',
        photoUrl:
            'https://via.placeholder.com/150/008000/FFFFFF%20?Text=Digital.com'),
    Faculty(
        name: 'Name',
        role: 'Instructor',
        photoUrl:
            'https://via.placeholder.com/150/000000/FFFFFF%20?Text=Digital.com'),
    Faculty(
        name: 'Name',
        role: 'Associate Professor',
        photoUrl:
            'https://via.placeholder.com/150/FFFF00/000000%20?Text=Digital.com'),
    Faculty(
        name: 'Name',
        role: 'Professor',
        photoUrl:
            'https://via.placeholder.com/150/800080/FFFFFF%20?Text=Digital.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculty List'),
      ),
      body: GridView.builder(
        itemCount: faculties.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final faculty = faculties[index];
          return GestureDetector(
            onTap: () {
              // TODO: Navigate to faculty detail screen
            },
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      faculty.photoUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    faculty.name,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 4),
                  Text(
                    faculty.role,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
