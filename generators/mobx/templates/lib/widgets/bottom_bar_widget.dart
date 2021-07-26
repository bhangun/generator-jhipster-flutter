import 'package:flutter/material.dart';
// import 'package:kutilangExample/bloc/app/app_bloc.dart';

class KutBotomBar extends StatefulWidget {
  KutBotomBar() ;

  @override
  _KutBotomBarState createState() => _KutBotomBarState();
}

class _KutBotomBarState extends State<KutBotomBar> {
  /* final _appBloc = null;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold); */
  /* static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ]; */

  /* void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _appBloc.goTo(_selectedIndex);
    });
  } */
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('')/* BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ), */
    );
  }
}