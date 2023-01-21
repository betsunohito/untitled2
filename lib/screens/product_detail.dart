import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Model/product.dart';
import '../data/dbHelper.dart';

class ProductDetail extends StatefulWidget {
  Product product;
  ProductDetail(this.product);
  @override
  State<StatefulWidget> createState() {
    return _ProductDetailState(product);
  }
}

enum Options { delete, update }

class _ProductDetailState extends State {
  var dbHelper = DbHelper();
  Product product;
  _ProductDetailState(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün detayı : ${product.name}"),
        actions: [
          PopupMenuButton<Options>(
            onSelected: selectProcess,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
              const PopupMenuItem<Options>(
                value: Options.delete,
                child: Text("Sil"),
              ),
              const PopupMenuItem<Options>(
                value: Options.update,
                child: Text("Güncelle"),
              )
            ],
          )
        ],
      ),
      body: buildProductDetail(),
    );
  }

  buildProductDetail() {}

  void selectProcess(Options options) async{
    switch(options){
      case Options.delete:
        await dbHelper.delete(product.id);
        Navigator.pop(context,true);
        break;
      default:
    }
  }
}
