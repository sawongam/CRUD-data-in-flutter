import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class JsonHome extends StatefulWidget {
  const JsonHome({super.key});

  @override
  State<JsonHome> createState() => _JsonHomeState();
}

class _JsonHomeState extends State<JsonHome> {
  List _contacts = [];
  List<bool> _showOptions = []; // List to track visibility of options for each contact

  @override
  void initState() {
    super.initState();
    readJSON();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showOptions = List.generate(_contacts.length, (index) => false);
        });
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 69),
                const Text(
                  'Contacts',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                Expanded(
                  child: ListView.builder(
                    itemCount: _contacts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.blueGrey[800],
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {
                                // Toggle visibility of options when tapping on a contact
                                setState(() {
                                  _showOptions = List.generate(_contacts.length, (index) => false);
                                  _showOptions[index] = !_showOptions[index];
                                });
                              },
                              leading: const Icon(
                                Icons.person_outline_rounded,
                                size: 40,
                                color: Colors.white60,
                              ),
                              title: Text(
                                _contacts[index]['name'],
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 22,
                                ),
                              ),
                              subtitle: Text(
                                _contacts[index]['phone'],
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _showOptions[index], // Toggle visibility
                              child: Container(
                                height: 50,
                                padding: const EdgeInsets.all(16.0),
                                color: Colors.blueGrey[700],
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        makePhoneCall('tel:${_contacts[index]['phone']}');
                                      },
                                      padding: const EdgeInsets.all(0),
                                      splashRadius: 25,
                                      icon: const Icon(
                                        Icons.call,
                                        color: Colors.white60,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      padding: const EdgeInsets.all(0),
                                      splashRadius: 25,
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white60,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      padding: const EdgeInsets.all(0),
                                      splashRadius: 25,
                                      icon: const Icon(
                                        Icons.delete_outline_rounded,
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void readJSON() async {
    String pathJson = 'assets/json.json';
    String parsedJson = await rootBundle.loadString(pathJson);
    final decodedJson = jsonDecode(parsedJson);
    setState(() {
      _contacts = decodedJson['contacts'];
      _showOptions = List.generate(_contacts.length, (index) => false);
    });
  }

  void makePhoneCall(String tel) {
    setState(() {
      print(tel);
      launchUrl(Uri.parse(tel));
    });
  }
}
