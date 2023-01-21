import 'package:flutter/material.dart';

class Customer extends Person {
  Customer() {}
  Customer.withInfo(String firstName, String lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
  }
}

class Personel extends Person {
  int dateOfStart = 0;
  Personel() {}
  Personel.withInfo(String firstName, String lastName, int dateOfStart) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.dateOfStart = dateOfStart;
  }
}

class Person {
  String firstName = "";
  String lastName = "";
}

class CustomerManager {
  void add(Customer customer) {
    print("Eklendi." + customer.firstName.toString());
  }

  void update() {
    print("Güncellendi.");
  }

  void delete() {
    print("Silindi.");
  }
}

class Product {
  String name = "";
  double unitPrice = 0;
  Product(String name, double unitPrice) {
    this.name = name;
    this.unitPrice = unitPrice;
  }
}


void main() {
  var customerManager = new CustomerManager();
  var customer1 = new Customer.withInfo("Tarkan", "Kaya");

  var customer2 = new Customer();
  customer2.firstName = "Engin";
  customer2.lastName = "Demiroğ";
  customerManager.add(customer1);
  var product1 = Product("Tarkan", 1);
  var product2 = Product("Ömer", 2);
  List<Product> values = [product1, product2];
  print(values[0].unitPrice);
  print(values[1].unitPrice);
  var urunler = new List.filled(5, "0", growable: false);
  urunler[0] = "Laptop";
  urunler[1] = "Mouse";
  urunler[2] = "Keyboard";
  urunler[3] = "Monitor";
  urunler[4] = "Microfon";
  print(urunler);
  print(urunler[2]);
  var sehirler = ["Ankara", "İstanbul", "İzmir"];
  print(sehirler);
  sehirler.add("Diyarbakır");
  print(sehirler);
  print(sehirler.where((element) => element.contains("a")));
  print(sehirler.first);
  for (var dongu in sehirler) {
    print(dongu);
  }
  var dictionary1 = new Map();
  dictionary1["book"] = "kitap";
  dictionary1["little"] = "küçük";
  var dictionary2 = {"kitap": "book", "küçük": "little"};
  dictionary2["büyük"] = "big";
  dictionary1.remove("book");

  print(dictionary1);
  print(dictionary2);
  for (var key in dictionary2.keys) {
    print(key + " :" + dictionary2[key].toString());
  }
  for (var value in dictionary2.values) {
    print(value);
  }
  print(dictionary2.containsKey("kitap"));
  //same
  dictionary2.forEach((key, value) => {print(key + " :" + value)});
  //same
  dictionary2.forEach((key, value) {
    print(key + " :" + value);
  });

  selamVer("Tarkan");

  print(hesapla(100000, 15));
  test1(2, 5);
  test2(sayi1: 1, sayi2: 5, sayi3: 48);
  PersonelManager personelManager = new PersonelManager();
  personelManager.update();

  runApp(MaterialApp(
    home: MyApp(),
  ));
}

void selamVer(String kullanici) {
  print("Merhaba " + kullanici);
}

void test1(int sayi1, [sayi2, sayi3]) {
  print(sayi1);
  print(sayi2);
  print(sayi3);
}

void test2({int? sayi1, int? sayi2, int? sayi3}) {
  print("test2");
  print(sayi1);
  print(sayi2);
  print(sayi3);
  print("test2");
}

double hesapla(double krediTutari, double yuzde) {
  var sonuc = (krediTutari * yuzde / 100);
  return sonuc;
}

class MyApp extends StatelessWidget {
  String mesaj = "ilk Uygulamam!";
  var values = ["data", "Tarkan", "Any", "Person"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: values.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(values[index]);
                  })

            //ListView(children: <Widget>[Text("data"),Text("Tarkan"),Text("Any"),],),

          ),
          Center(
            child: ElevatedButton(
              child: const Text("Sonucu Gör"),
              onPressed: () {
                String mesaj2 = kaldiMiGectiMi(61);
                mesajGonder(context, mesaj2);
              },
            ),
          ),
        ],
      ),
    );
  }
}

String kaldiMiGectiMi(int puan) {
  String mesaj = "";
  if (puan > 60) {
    mesaj = "Geçti";
  } else {
    mesaj = "Kaldı";
  }
  return mesaj;
}

void mesajGonder(BuildContext context, String mesaj) {
  var alert = AlertDialog(
    title: Text("Sınav Sonucu"),
    content: Text(mesaj),
  );
  showDialog(context: context, builder: (BuildContext context) => alert);
}

class PersonelManager {
  void add() {
    print("Eklendi.");
  }
  void update()
  {
    print("Güncellendi.");
  }
  void delete()
  {
    print("Silindi.");
  }
}
