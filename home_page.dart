import 'package:flutter/material.dart';
import 'package:project/Appointment.dart';
import 'package:project/LabTests.dart';
import 'package:project/SelectedTestsPage.dart';
import 'package:project/search_page.dart';
import 'ProfileScreen.dart';
import 'login_page.dart';
import 'Doctors.dart';
import 'Appointment.dart';
import 'Pharmacy.dart';


class HomePage extends StatelessWidget {
  final User user= User(name: 'John Doe', email: 'john.doe@example.com', profileImageUrl: 'https://example.com/profile.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 60, 120, 224),
        title: Text(
          "LAUMC",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchPage());
            },
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement notifications functionality
            },
            color: Colors.white,
          ),
        ],
      ),
      drawer: Drawer(
        
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                "Welcome to LAUMC",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                "Profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(user: user),),);
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text(
                "Favorites",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // TODO: Implement favorites functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text(
                "Cart",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // TODO: Implement cart functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // TODO: Implement settings functionality
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                "Logout",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                 Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage("assets/images/banner.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      "Welcome to LAUMC",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      "Where patients come first",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height:10          
            ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  MouseRegion(
            cursor: SystemMouseCursors.click,
            child:  _buildCategoryCard(
                    context,
                    "Doctors",
                    "assets/images/doctors.jpg",
                    () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Doctors()));
                    },
                  ),
                  ),
                  MouseRegion(
            cursor: SystemMouseCursors.click,
            child: _buildCategoryCard(
                    context,
                    "Appointments",
                    "assets/images/appointment.jpg",
                    ()
                     {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentPage()));
                    },
                  ),
                  ),
                  MouseRegion(
            cursor: SystemMouseCursors.click,
                  child: _buildCategoryCard(
                    context,
                    "Pharmacy",
                    "assets/images/pharmacy.jpg",
                    
                  
                    () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PharmacyPage()));
                    },
                  ),
                  ),
                  MouseRegion(
            cursor: SystemMouseCursors.click,
                  child: _buildCategoryCard(
                    context,
                    "Lab Tests",
                    "assets/images/lab-tests.jpg",
                    () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LabTestsPage()));
                    },
                  ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, String imagePath, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.2),
            ],
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      height: 250, // Updated height
    ),
  );
}
}