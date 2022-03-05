import 'package:flutter/material.dart';
import 'pages/community.dart';
import 'pages/my_doctors.dart';
import 'pages/patient_me.dart';
import 'pages/patient_home.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [
    PatientHome(),
    MyDoctorsPage(),
    CommunityPage(),
    PatientMePage()
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                label: 'My Doctors', icon: Icon(Icons.medical_services)),
            BottomNavigationBarItem(
                label: 'Community', icon: Icon(Icons.forum)),
            BottomNavigationBarItem(label: 'Me', icon: Icon(Icons.person)),
          ]),
    );
  }
}
