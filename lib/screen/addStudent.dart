import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:work_with_server/data/data.dart';

class AddStudent extends StatelessWidget {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _course = TextEditingController();
  final TextEditingController _score = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            try {
              final newStudent = await postStudents(_firstName.text,
                  _lastName.text, _course.text, int.parse(_score.text));
              Navigator.pop(context, newStudent);
            } catch (e) {
              debugPrint(e.toString());
            }
          },
          label: Row(
            children: [
              const Icon(Icons.save_alt_rounded),
              const SizedBox(
                width: 4,
              ),
              const Text("Save Student")
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
              controller: _firstName,
              decoration: const InputDecoration(
                label: Text("First name"),
              )),
          const SizedBox(
            height: 8,
          ),
          TextField(
              controller: _lastName,
              decoration: const InputDecoration(
                label: Text("Last name"),
              )),
          const SizedBox(
            height: 8,
          ),
          TextField(
              controller: _course,
              decoration: const InputDecoration(
                label: Text("Course"),
              )),
          const SizedBox(
            height: 8,
          ),
          TextField(
              controller: _score,
              decoration: const InputDecoration(
                label: Text("Score"),
              )),
        ]),
      ),
    );
  }
}
