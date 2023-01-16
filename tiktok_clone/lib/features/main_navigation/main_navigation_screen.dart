import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final screens = [
    const Center(child: Text('Home')),
    const Center(child: Text('Search')),
    const Center(child: Text('Search')),
    const Center(child: Text('Search')),
    const Center(child: Text('Search')),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTapBottomNavigationItem,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: 'Home',
            tooltip: "what are you?",
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
            label: 'Search',
            tooltip: "what are you?",
            backgroundColor: Colors.blue,
          ),
          // BottomNavigationBarItem(
          //   icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
          //   label: 'Search',
          //   tooltip: "what are you?",
          //   backgroundColor: Colors.amber,
          // ),
          // BottomNavigationBarItem(
          //   icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
          //   label: 'Search',
          //   tooltip: "what are you?",
          //   backgroundColor: Colors.blue,
          // ),
          // BottomNavigationBarItem(
          //   icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
          //   label: 'Search',
          //   tooltip: "what are you?",
          //   backgroundColor: Colors.teal,
          // ),
        ],
      ),
    );
  }

  void _onTapBottomNavigationItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
