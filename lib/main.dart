import 'package:flutter/material.dart';
import 'package:inception/models/students.dart';
import 'package:inception/screens/student_add.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, "ibrahim", "Yağmur", 95),
    Student.withId(2, "demir", "Demiri", 45),
    Student.withId(3, "furkan", "Doğan3", 25),
  ];
  Student selectedStudent = Student.withId(0, "Hiç kimse", "", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci takip sistemi"),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Grade : " +
                        students[index].grade.toString() +
                        "[" +
                        students[index].getStatus +
                        "]"),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTHFfUcChyUa_N6qlE3IZoWHXD2NnBbWOChg&usqp=CAU"),
                    ),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        this.selectedStudent = students[index];
                      });
                      setState(() {});
                    },
                    onLongPress: () {
                      print(" Uzun Basıldı ");
                    });
              }),
        ),
        Text(" Seçili öğrenci " + selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.yellow,
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Yeni öğrenci"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentAdd(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.green,
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {},
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.blue,
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    );
  }

  buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
