import 'package:flutter/material.dart';
import 'package:project/SelectedTestsPage.dart';

class LabTests extends StatefulWidget {
  @override
  _LabTestsState createState() => _LabTestsState();
}

class _LabTestsState extends State<LabTests> {
  List<String> _labTests = [
    'Complete Blood Count (CBC)',
    'Comprehensive Metabolic Panel (CMP)',
    'Lipid Panel',
    'Thyroid Panel',
    'Hemoglobin A1C',
    'Urinalysis',
    'Stool Culture',
    'Pap Smear',
    'Mammography',
    'Colonoscopy',
  ];

  List<bool> _selectedTests = List.filled(10, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab Tests'),
      ),
      body: ListView.builder(
        itemCount: _labTests.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(_labTests[index]),
            value: _selectedTests[index],
            onChanged: (bool? value) {
              setState(() {
                _selectedTests[index] = value!;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => LabTestsPage()));
        },
        label: Text('View Selected Tests'),
        icon: Icon(Icons.arrow_forward),
      ),
    );
  }
}
