import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_with_server/data/data.dart';
import 'package:work_with_server/screen/widgets/students.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
