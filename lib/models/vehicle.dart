// ignore: file_names
class Vehicles {
  int id = 0;
  String Title = "";
  int Price = 0;
  String Picture = "";

  Vehicles.withOutInfo();
  Vehicles.withId(int id, String Title, int Price, String Picture) {
    this.id = id;
    this.Title = Title;
    this.Price = Price;
    this.Picture = Picture;
  }
  Vehicles(String Title, int Price, String Picture) {
    this.Title = Title;
    this.Price = Price;
    this.Picture = Picture;
  }
}
