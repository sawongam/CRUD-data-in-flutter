import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'create.dart';
import 'read.dart';
import 'update.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    _askForStoragePermission();
    return MaterialApp(
      title: 'CRUD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // scaffoldBackgroundColor: Colors.black12,
        scaffoldBackgroundColor: Colors.blueGrey[900],
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Entry Management System',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 90.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateEntry()));
                },
                child: Text(
                  'Create Entry',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => const ViewEntryList()));
                },
                child: Text(
                  'View Entry List',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => const UpdateEntry()));
                },
                child: Text(
                  'Update Entry',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  showDialog(context: context,
                      builder: (context) =>
                          AlertDialog(
                            title: const Text('Delete Entry'),
                            content: const Text(
                                'Are you sure you want to delete current entry?'),
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  SharedPreferences prefs = await SharedPreferences
                                      .getInstance();
                                  prefs.remove('name');
                                  Navigator.of(context).pop();
                                  Fluttertoast.showToast(msg: 'Entry Deleted');
                                },
                                child: const Text('Yes'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No'),
                              ),
                            ],
                          )
                  );
                },
                child: Text(
                  'Delete Entry',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

void _askForStoragePermission() async {
  var status = await Permission.storage.request();
  if (status.isGranted) {
    // Permission granted, you can now access storage
    print('Storage permission granted.');
  } else {
    // Permission denied
    print('Storage permission denied.');
  }
}