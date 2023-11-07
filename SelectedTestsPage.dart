import 'package:flutter/material.dart';

class LabTest {
  final String name;
  final String price;
  

  LabTest({required this.name, required this.price});
}

class LabTestsPage extends StatelessWidget {
  final List<LabTest> labTests = [
    LabTest(
        name: "Blood Test",
        price: "\$50",
    ),
    LabTest(
        name: "Urine Test",
        price: "\$30",
    ),
    LabTest(
        name: "X-ray",
        price: "\$100",
    ),
    LabTest(
        name: "MRI",
        price: "\$500",
    ),
    LabTest(
        name: "CT Scan",
        price: "\$400",
    ),
    LabTest(
        name: "Ultrasound",
        price: "\$150",
    ),
    LabTest(
        name: "EKG",
        price: "\$75",
    ),
    LabTest(
        name: "Allergy Test",
        price: "\$100",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lab Tests"),
      ),
      body: ListView.builder(
        itemCount: labTests.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SelectedTestPage(selectedTest: labTests[index]),
                ),
              );
            },
            child: Card(
              child: ListTile(
                
                title: Text(labTests[index].name),
                subtitle: Text(labTests[index].price),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SelectedTestPage extends StatefulWidget {
  final LabTest selectedTest;

  SelectedTestPage({required this.selectedTest});

  @override
  _SelectedTestPageState createState() => _SelectedTestPageState();
}

class _SelectedTestPageState extends State<SelectedTestPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedTest.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          SizedBox(height: 16),
          Text ("Price: ${widget.selectedTest.price}"),
SizedBox(height: 16),
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text("Add to cart"),
Checkbox(
value: _isChecked,
onChanged: (value) {
setState(() {
_isChecked = value!;
});
},
),
],
),
],
),
);
}
}
