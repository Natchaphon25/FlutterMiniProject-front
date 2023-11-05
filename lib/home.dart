import 'package:flutter/material.dart';

import 'menu/home_page.dart';
import 'menu/fav_page.dart';
import 'menu/profile_page.dart';
// import 'page/pdfshow.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final tabs = [
    const HomePage(),
    const FavPage(),
    const ProfilePage(),
    // const PDFViewerPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        iconSize: 38,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Colors.white),
              activeIcon: Icon(Icons.home_outlined, color: Colors.orangeAccent,),
              label: '',
              backgroundColor: Color.fromARGB(255, 29, 29, 29) ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline, color: Colors.white),
              activeIcon: Icon(Icons.favorite_outline, color: Colors.orangeAccent,),
              label: '',
              backgroundColor: Color.fromARGB(255, 29, 29, 29)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, color: Colors.white),
              activeIcon: Icon(Icons.person_outline, color: Colors.orangeAccent,),
              label: '',
              backgroundColor: Color.fromARGB(255, 29, 29, 29)),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.dangerous),
          //     label: 'Pdf',
          //     backgroundColor: Color.fromARGB(255, 255, 111, 0)),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
