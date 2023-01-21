class Product {
  int id = 0;
  String name = "";
  String description = "";
  double unitPrice = 0;

  Product(this.name, this.description, this.unitPrice);
  Product.withId(this.id, this.name, this.description, this.unitPrice);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["description"] = description;
    map["unitPrice"] = unitPrice;
    if (id > 0) map["id"] = id;
    return map;
  }

  Product.fromObject(dynamic o) {
    this.id = o["id"];
    this.name = o["name"];
    this.description = o["description"];
    this.unitPrice = double.tryParse(o["unitPrice"].toString())!;
  }
}
