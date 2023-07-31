import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewEntryList extends StatefulWidget {
  const ViewEntryList({super.key});

  @override
  State<ViewEntryList> createState() => _ViewEntryListState();
}

class _ViewEntryListState extends State<ViewEntryList> {

  String finalName = '';

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
              'Entry List',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 90.0),
           Container(
             height: 35,
             width: 200,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(15.0),
               border: Border.all(
                 color: Colors.grey,
                 width: 1.5,
               ),
             ),
             child: Center(
               child: Text(
                 finalName,
                 style: const TextStyle(
                   fontWeight: FontWeight.bold,
                 ),
               ),
             )
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
          finalName = fName;
        });
      } else {
        setState(() {
          finalName = 'No Entry Found';
        });
      }
    });
  }


}
