import 'package:flutter/material.dart';
import 'package:provider_counter/pages/page1.dart';
import 'package:provider_counter/pages/page2.dart';
import 'package:provider_counter/pages/page3.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;


  final List<Widget> _pages = <Widget>[
    const Page1(),
    const Page2(),
    const Page3(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: _pages[_selectedIndex],
      

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Pagina 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Pagina 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Pagina 3',
          ),
        ],
      ),
    );
  }
}
