// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../Model/Student.dart';
import '../validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
  Student selectedStudents = Student.withId(0, "firstName", "lastName", 0);
  StudentEdit(Student selectedStudents) {
    this.selectedStudents = selectedStudents;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentEditState(selectedStudents);
  }
}

class _StudentEditState extends State with StudentValidationMixin {
  Student selectedStudents = Student("firstName", "lastName", 0);
  var formKey = GlobalKey<FormState>();
  _StudentEditState(Student selectedStudents) {
    this.selectedStudents = selectedStudents;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni öğrenci ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      initialValue: selectedStudents.firstName,
      decoration: InputDecoration(labelText: "Öğrenci adı", hintText: "Tarkan"),
      validator: validateFirstName,
      onSaved: (String? value) {
        selectedStudents.firstName = value!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudents.lastName,
      decoration:InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Kaya"),
      validator: validateLastName,
      onSaved: (String? value) {
        selectedStudents.lastName = value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudents.grade.toString(),
      decoration: InputDecoration(labelText: "Aldığı Not", hintText: "60"),
      validator: validateGrade,
      onSaved: (String? value) {
        selectedStudents.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(
        "${selectedStudents.firstName} ${selectedStudents.lastName} ${selectedStudents.grade}");
  }
}
