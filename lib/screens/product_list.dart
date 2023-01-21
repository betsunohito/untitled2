import 'package:flutter/material.dart';
import 'package:untitled2/screens/product_add.dart';
import 'package:untitled2/screens/product_detail.dart';
import '../Model/product.dart';
import '../data/dbHelper.dart';

class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductListState();
  }
}

class _ProductListState extends State {
  var dbHelper = DbHelper();
  List<Product> products = <Product>[];
  int productCount = 0;
  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ürün Listesi"),
      ),
      body: buildProductList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToProductAdd();
        },
        tooltip: "Yeni ürün ekle.",
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView buildProductList() {
    return ListView.builder(
        itemCount: productCount,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.cyan,
            elevation: 2.0,
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.black12,
                child: Text("P"),
              ),
              title: Text(products[position].name),
              subtitle: Text("${products[position].description} Fiyatı: ${products[position].unitPrice}"),
              onTap: () {
                goToDetail(products[position]);
              },
            ),
          );

        });

  }

  void goToProductAdd() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProductAdd())) ?? false;
    if (result) {
      getProducts();
    }
  }

  void getProducts() async {
    var productsFuture = dbHelper.getProducts();
    productsFuture.then((data) {
      setState(() {
      products = data;
      productCount=data.length;
      });
    });
  }

  void goToDetail(Product product) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail(product))) ?? false;
    if(result)
      {
        getProducts();
      }
  }
}
