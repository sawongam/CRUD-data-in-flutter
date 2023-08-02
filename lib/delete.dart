import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteEntry extends StatefulWidget {
  const DeleteEntry({super.key});

  @override
  State<DeleteEntry> createState() => _ViewDeleteEntryState();
}

class _ViewDeleteEntryState extends State<DeleteEntry> {

  List<String> finalName = [];

  @override
  void initState() {
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100.0),
          const Text(
            'Delete Entry',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30.0),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Card(
                color: Colors.blueGrey[800],
                child: ListTile(
                    title: Center(
                      child: Text(finalName[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  trailing: IconButton(
                    onPressed: () async {
                      var prefs = await SharedPreferences.getInstance();
                      setState(() {
                        prefs.remove('name_$index');
                        finalName.removeAt(index);
                      });
                    },
                    icon: const Icon(Icons.delete),
                    color: Colors.grey[400],
                ),
                ),
              );
            },
                itemCount: finalName.length),
          ),
        ],
      ),
    );
  }

  void getName() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      int count = prefs.getInt('counter') ?? -1;
      if (count == -1) {
        finalName.add('No Entries');
      }
      for (int i = 0; i < count; i++) {
        finalName.add(prefs.getString('name_$i') ?? 'No Value');
      }
    });
  }


}