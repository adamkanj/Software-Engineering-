import 'package:flutter/material.dart';
class Doctor {
  final String name;
  final String specialty;

  Doctor(this.name, this.specialty);
  
  static where(Function(dynamic doctor) param0) {}
}

class SearchPage extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }
  
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        var result = null;
        close(context, result);
      },
    );
  }

  @override
 @override
  Widget buildResults(BuildContext context) {
    final List<Doctor> filteredDoctors = Doctor.where((doctor) {
      return doctor.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredDoctors.length,
      itemBuilder: (BuildContext context, int index) {
        final Doctor doctor = filteredDoctors[index];
        return ListTile(
          title: Text(doctor.name),
          subtitle: Text(doctor.specialty),
          onTap: () {
            // TODO: Implement doctor detail page
          },
        );
      },
    );
  }

  @override
  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> recentSearches = ["Dr. Smith", "Dr. Johnson", "Dr. Lee"];

    return ListView.builder(
      itemCount: recentSearches.length,
      itemBuilder: (BuildContext context, int index) {
        final String suggestion = recentSearches[index];
        return ListTile(
          leading: Icon(Icons.history),
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
          },
        );
      },
    );
  }

}