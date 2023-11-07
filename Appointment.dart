import 'package:flutter/material.dart';

class Appointment {
  final String doctor;
  final DateTime dateTime;

  Appointment({required this.doctor, required this.dateTime});
}

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedDoctor;
  DateTime? _selectedDateTime;
  List<Appointment> _appointments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Appointments')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Choose a doctor', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    value: _selectedDoctor,
                    items: ['Dr. Lee', 'Dr. Smith', 'Dr. Johnson']
                        .map((doctor) => DropdownMenuItem(
                              value: doctor,
                              child: Text(doctor),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedDoctor = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please choose a doctor';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Text('Choose a date and time', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  ElevatedButton(
                    child: Text(_selectedDateTime == null
                        ? 'Select a date and time'
                        : 'Selected date and time: ${_selectedDateTime!.toString()}'),
                    onPressed: () async {
                      final selectedDateTime = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                      );
                      if (selectedDateTime != null) {
                        final selectedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (selectedTime != null) {
                          setState(() {
                            _selectedDateTime = DateTime(
                              selectedDateTime.year,
                              selectedDateTime.month,
                              selectedDateTime.day,
                              selectedTime.hour,
                              selectedTime.minute,
                            );
                          });
                        }
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    child: Text('Create appointment'),
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          _selectedDateTime != null) {
                        setState(() {
                          _appointments.add(Appointment(
                            doctor: _selectedDoctor!,
                            dateTime: _selectedDateTime!,
                          ));
                          _selectedDoctor = null;
                          _selectedDateTime = null;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 1, thickness: 1),
          Expanded(
            child: ListView.builder(
              itemCount: _appointments.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(16),
                  child: ListTile(
                    title: Text('Appointment with ${_appointments[index].doctor}'),
subtitle: Text('Date and Time: ${_appointments[index].dateTime.toString()}'),
trailing: IconButton(
icon: Icon(Icons.cancel),
onPressed: () {
setState(() {
_appointments.removeAt(index);
});
},
),
),
);
},
),
),
],
),
);
}
}







