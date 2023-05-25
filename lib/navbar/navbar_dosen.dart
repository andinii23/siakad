import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../pages/home dosen/home_dosen.dart';
import '../utilites/constants.dart';

class NavbarDosen extends StatefulWidget {
  const NavbarDosen({super.key});

  @override
  State<NavbarDosen> createState() => _NavbarDosenState();
}

class _NavbarDosenState extends State<NavbarDosen> {
    int _selectedIndex = 0;
  static final List<Widget> _navScreen = <Widget>[
    const HomeDosen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: mainWhiteColor,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1E3B78).withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 4,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
           gap: 8,
            backgroundColor: Colors.white,
            color: const Color(0xFF1E3B78),
            activeColor: const Color(0xFF1E3B78),
            tabBackgroundColor: Colors.grey.shade200,
            padding: const EdgeInsets.all(16),
          tabs: const[
            GButton(
                icon: Icons.home,
                text: "Home",
              ),
          ],
          selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
      body: Center(child: _navScreen.elementAt(_selectedIndex)),
    );
  }
}