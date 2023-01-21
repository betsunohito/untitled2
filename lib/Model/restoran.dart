// ignore: file_names
class Products {
  int id = 0;
  String title = "";
  int price = 0;
  String picture = "";

  Products.withOutInfo();
  Products.withId(this.id, this.title, this.price, this.picture);
  Products(this.title, this.price, this.picture);
  Products.categories(this.id, this.title, this.picture);
}
