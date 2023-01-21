import 'package:flutter/material.dart';
import 'package:untitled2/Model/Student.dart';
import 'package:untitled2/screens/product_list.dart';
import 'package:untitled2/screens/restaurant_page.dart';
import 'package:untitled2/screens/student_add.dart';
import 'package:untitled2/screens/student_edit.dart';
import 'package:untitled2/screens/otogaleri.dart';

import '../main.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";
  Student selectedStudent = Student.withId(0, "", "", 0);
  List<Student> students = [
    Student.withId(1, "Tarkan", "Kaya", 25),
    Student.withId(2, "Engin", "Demiroğ", 65),
    Student.withId(3, "Kerem", "Varış", 45)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(mesaj),
        ),
        body: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://static.wikia.nocookie.net/leagueoflegends/images/0/0d/Zyra_OriginalSquare.png/revision/latest/smart/width/250/height/250?cb=20160526214642"),
                    ),
                    title: Text(
                        "${students[index].lastName} ${students[index].firstName}"),
                    subtitle: Text(
                        "Sınavdan Aldığı Not: ${students[index].grade} [${students[index].getStatus}]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });
                    },
                  );
                })),
        ElevatedButton(
          onPressed: (){ Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainPage()));},
          child: Row(
            children: const [
              Icon(Icons.add),
              SizedBox(
                width: 5.0,
              ),
              Text("Anasayfa Test'e git"),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: (){ Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProductList()));},
          child: Row(
            children: const [
              Icon(Icons.add),
              SizedBox(
                width: 5.0,
              ),
              Text("Test Products'a git"),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: (){ Navigator.push(
              context, MaterialPageRoute(builder: (context) => RestaurantView()));},
          child: Row(
            children: const [
              Icon(Icons.add),
              SizedBox(
                width: 5.0,
              ),
              Text("Test restoran'ta git"),
            ],
          ),
        ),
        Text("Seçili Öğrenci: ${selectedStudent.firstName}"),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Yeni Öğrenci"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentAdd(students)))
                      .then((students) => setState(() {}));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.update),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              StudentEdit(selectedStudent)))
                      .then((students) => setState(() {}));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  String mesaj2 = "Silindi: ${selectedStudent.firstName}";
                  mesajGonder(context, mesaj2);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }

  void mesajGonder(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
