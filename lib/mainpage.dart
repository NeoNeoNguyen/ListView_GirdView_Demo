// ignore_for_file: unused_element, unused_field, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:tuan03/pages/gridproduct.dart';
import 'package:tuan03/pages/info.dart';
import 'package:tuan03/pages/listproduct.dart';
import 'package:tuan03/pages/slideproduct.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

List<Widget> _widgetOptions = <Widget>[
  SlideProduct(),
  GridProduct(),
  ListProduct(),
  InfoWidget()
];

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits),
              label: 'Grid',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Info',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
        appBar: AppBar(title: Text('Products')),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              _myheader(),
              ListTile(
                leading: Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  _selectedIndex = 0;
                  setState(() {});
                },
              ),
              ListTile(
                leading: Icon(Icons.production_quantity_limits),
                title: const Text('Grid'),
                onTap: () {
                  Navigator.pop(context);
                  _selectedIndex = 1;
                  setState(() {});
                },
              ),
              ListTile(
                leading: Icon(Icons.supervised_user_circle),
                title: const Text('List'),
                onTap: () {
                  Navigator.pop(context);
                  _selectedIndex = 2;
                  setState(() {});
                },
              ),
              ListTile(
                leading: Icon(Icons.list),
                title: const Text('Info'),
                onTap: () {
                  Navigator.pop(context);
                  _selectedIndex = 3;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ));
  }
}

class _myheader extends StatelessWidget {
  const _myheader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: UserAccountsDrawerHeader(
        accountName: Text('Neo Nguyen'),
        accountEmail: Text('neonguyen@gmail.com'),
        currentAccountPicture: CircleAvatar(
          backgroundImage: NetworkImage(''),
        ),
      ),
    );
  }
}
