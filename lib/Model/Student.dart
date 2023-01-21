// ignore: file_names
class Student {
  int id = 0;
  String firstName = "";
  String lastName = "";
  int grade = 0;

  Student.withOutInfo();
  Student.withId(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  String get getFirstName {
    return "OGR - ${firstName}";
  }

  set setFirstName(String value) {
    firstName = value;
  }

  String get getStatus {
    String message = "";
    if (grade > 50) {
      message = "Geçti";
    } else if (grade > 40) {
      message = "Bütünlemeye Kaldı";
    } else {
      message = "Kaldı";
    }
    return message;
  }

}
