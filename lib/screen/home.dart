import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_with_server/data/data.dart';
import 'package:work_with_server/screen/addStudent.dart';
import 'package:work_with_server/widgets/students.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: [
            const Icon(Icons.add),
            const SizedBox(
              width: 4,
            ),
            Text("Add Student".toUpperCase()),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () async {
          final result = await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddStudent(),
          ));
          setState(() {});
        },
      ),
      appBar: AppBar(
        title: Text("Work with server"),
      ),
      body: FutureBuilder(
        future: getStudents(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return StudentsCard(student: snapshot.data![index]);
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
