import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'create.dart';
import 'read.dart';
import 'update.dart';
import 'delete.dart';

class SharedHome extends StatelessWidget {
  const SharedHome({super.key});

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
                    MaterialPageRoute(builder: (context) => const CreateEntry()));
              },
              child: Text(
                'Create Entry',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewEntryList()));
              },
              child: Text(
                'View Entry List',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdateEntry()));
              },
              child: Text(
                'Update Entry',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DeleteEntry()));
              },
              child: Text(
                'Delete Entry',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete Entry'),
                      content: const Text(
                          'Are you sure you want to delete all entries?'),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            // SharedPreferences prefs = await SharedPreferences.getInstance();
                            // prefs.remove('name');
                            var prefs =
                            await SharedPreferences.getInstance();
                            prefs.clear();
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
                    ));
              },
              child: Text(
                'Delete All Entry',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
