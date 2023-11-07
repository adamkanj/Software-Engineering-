import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String specialty;
  final String imagePath;

  Doctor({required this.name, required this.specialty, required this.imagePath});
}

class Doctors extends StatefulWidget {
  @override
  _DoctorsPageState createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<Doctors> {
  final List<Doctor> _doctors = [    Doctor(      name: "Dr. Lee",      specialty: "Neurologist",      imagePath: "assets/images/Dr3.jpg",    ),    Doctor(      name: "Dr. Smith",      specialty: "Surgeon",      imagePath: "assets/images/Dr2.jpg",    ),    Doctor(      name: "Dr. Johnson",      specialty: "Pediatrician",      imagePath: "assets/images/Dr1.jpg",    ),  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors"),
      ),
      body: ListView.builder(
        itemCount: _doctors.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Navigate to doctor's detail view
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    _doctors[index].imagePath,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Text(
                    _doctors[index].name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    _doctors[index].specialty,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
