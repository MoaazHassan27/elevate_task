import '../../data/models/product.dart';

class ProductEntity {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final Rating rating;

  ProductEntity(
      {required this.id,
      required this.rating,
      required this.price,
      required this.description,
      required this.title,
      required this.image});
}
