import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateEntry extends StatelessWidget {
  CreateEntry({super.key});

  var name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Create Entry',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 90.0),
            SizedBox(
              width: 340,
              child: TextField(
                controller: name,
                style: const TextStyle(
                  color: Colors.white,
                ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(36.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(36.0),
                    ),
                    labelText: 'Name',
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if(name.text.isNotEmpty) {
                          var entryName = name.text;
                          SharedPreferences.getInstance().then((prefs) {
                            prefs.setString('name', entryName);
                            name.clear();
                            Fluttertoast.showToast(msg: 'Entry Created');
                          });

                        } else {
                          Fluttertoast.showToast(
                          msg: 'Name is required',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.pink,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        }
                      },
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
