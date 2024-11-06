import 'package:flutter/material.dart';
import '../views/poli_page.dart';
import '../views/pasien_page.dart';

/// Flutter code sample for [Drawer].

void main() => runApp(const DrawerApp());

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const DrawerExample(),
    );
  }
}

class DrawerExample extends StatefulWidget {
  const DrawerExample({super.key});

  @override
  State<DrawerExample> createState() => _DrawerExampleState();
}

class _DrawerExampleState extends State<DrawerExample> {
  String selectedPage = '';
  int currentPageIndex = 0;
  String titlePage = '';
  final List<Map<String, dynamic>> pages = [
    {'page': Polipage(), 'title': 'Data Poli'},
    {'page': Center(child: Text("Profile Page")), 'title': 'Profile'},
    {'page': Center(child: Text("Settings Page")), 'title': 'Settings'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[currentPageIndex]['title'], 
        style: const TextStyle(
          color: Colors.white
        ),
        ),
        backgroundColor: const Color(0xFF2499C0),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Poliklinik Sinar Kasih',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Data Poli'),
              onTap: () {
                setState(() {
                  currentPageIndex = 0;
                  titlePage = 'Data Poli';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Data Pasien'),
              onTap: () {
                setState(() {
                  currentPageIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                setState(() {
                  currentPageIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: <Widget>[
        Center(child: Polipage()),
        Center(child: Pasienpage()), // Halaman untuk Profile
        Center(child: Text("Settings Page")), // Halaman untuk Settings
      ][currentPageIndex],
    );
  }
}
