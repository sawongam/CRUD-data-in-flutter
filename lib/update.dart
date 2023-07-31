import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateEntry extends StatefulWidget {
   const UpdateEntry({super.key});

  @override
  State<UpdateEntry> createState() => _UpdateEntryState();
}

class _UpdateEntryState extends State<UpdateEntry> {
   var name = TextEditingController();
   var currentName = '';

   @override
   void initState() {
     super.initState();
     getName();
   }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Update Entry',
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
                  labelText: 'Updated Name',
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
                        if (entryName == currentName) {
                          Fluttertoast.showToast(
                            msg: 'Updated Name is same as Current Name',
                          );
                          return;
                        } else {
                          SharedPreferences.getInstance().then((prefs) {
                            prefs.setString('name', entryName);
                            name.clear();
                            Fluttertoast.showToast(msg: 'Entry Updated');
                          });
                        }
                      } else {
                        Fluttertoast.showToast(
                          msg: 'Updated Name is required',
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

   void getName() async {
     SharedPreferences.getInstance().then((prefs) {
       var fName = prefs.getString('name');
       if (fName != null) {
         setState(() {
           currentName = fName;
         });
       } else {
         setState(() {
           currentName = 'No Entry Found';
         });
       }
     });
   }
}