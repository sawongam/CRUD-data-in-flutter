import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'JSON/home.dart';
import 'Shared Preferences/home.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'CRUD in Flutter',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 90.0),
            Card(
              color: Colors.blueGrey[700],
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SharedHome()));
                },
                title: Text(
                  'Shared Preferences',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Card(
              color: Colors.blueGrey[700],
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const JsonHome()));
                },
                title: Text(
                  'JSON',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Card(
              color: Colors.blueGrey[700],
              child: ListTile(
                onTap: () {
                  Fluttertoast.showToast(msg: "Coming Soon!");
                },
                title: Text(
                  'Sqlite',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
