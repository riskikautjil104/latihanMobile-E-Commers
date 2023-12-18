class Product{
  Product({
    required this.id, 
    required this.name,
    this.description='', 
    required this.price, 
    this.gambar='',

  });
  String id;
  String name;
  String description; 
  int price; 
  String gambar;
}