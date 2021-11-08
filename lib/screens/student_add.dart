

import 'package:flutter/material.dart';
import 'package:inception/models/students.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();
   Student student = Student("","",0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[buildFirstNameField(), buildlastNameField(),buildGradeField(),buildSubmitButton()],
          ),
        ),
      ),
    );
  }

 Widget buildFirstNameField(){
  
  

    return TextFormField(
      decoration: const InputDecoration(labelText: "Öğrenci Adı", hintText: "İbrahim"),
      onSaved: ( value){
       student.firstName =value!;
      },
    );
  
  }
  
  Widget buildlastNameField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Öğrenci Soyadı", hintText: "YAĞMUR"),
      onSaved: ( value){
       
       student.lastName =value!;
      },
    );

  }
  
  Widget buildGradeField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Aldığı Not", hintText: "75"),
      onSaved: ( value){
       
       student.grade = int.parse(value!);
      },
    );
  }

Widget buildSubmitButton(){

  return ElevatedButton(
   child: Text("Kaydet"), 
  onPressed: (){
    
    formKey.currentState!.save();  
    widget.students.add(student);
    Navigator.pop(context);
    

  }
  );
}
}