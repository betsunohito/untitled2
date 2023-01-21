class StudentValidationMixin{
  String? validateFirstName(String? value){
    return value==null ||  value.length<3 ? "İsim en az üç karakter olmalıdır." : null;
  }
  String? validateLastName(String? value){
    return value==null ||  value.length<3 ? "Soyad en az üç karakter olmalıdır." : null;
  }
  String? validateGrade(String? value){
    if(value!=null) {
      var grade = int.parse(value);
      return grade<0 || grade>100
          ? "Not 0-100 arasında olmalı."
          : null;
    }
  }
}