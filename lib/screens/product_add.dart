import 'package:flutter/material.dart';
import '../Model/product.dart';
import '../data/dbHelper.dart';

class ProductAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductaddState();
  }
}

class ProductaddState extends State {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtUnitPrice = TextEditingController();
  var dbHelper = DbHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni ürün ekle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            buildNameField(),
            buildDescriptionField(),
            buildUnitPriceField(),
            buildSaveButton()
          ],
        ),
      ),
    );
  }
  Widget buildNameField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Ürün Adı"),
      controller: txtName,
    );
  }


  Widget buildDescriptionField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Ürün Açıklama"),
      controller: txtDescription,
    );
  }
  Widget buildUnitPriceField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Birim Fiyatı"),
      controller: txtUnitPrice,
    );
  }

  buildSaveButton() {
    return TextButton(
      child: const Text("Ekle"), onPressed: () { addProduct(); },
    );
  }

  void addProduct() async{
   var result = await dbHelper.insert(Product(txtName.text,txtDescription.text,double.tryParse(txtUnitPrice.text)!));
   Navigator.pop(context,true);
  }

}
