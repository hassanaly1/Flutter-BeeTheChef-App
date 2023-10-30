import 'package:flutter/material.dart';

class ProductModel {
  final String image, title, description;
  final double price;
  final int size, id;
  final Color color;

  ProductModel(
      {required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.size,
      required this.id,
      required this.color});
}

List<ProductModel> products = [
  ProductModel(
    id: 1,
    title: "Office Code",
    price: 234.0,
    size: 12,
    description:
        "Elevate your office attire with the Office Code bag. This stylish accessory is designed for professionals who value both fashion and function. With a sleek design and a deep blue color, it's the perfect addition to your work ensemble.",
    image: "assets/images/bag_1.png",
    color: const Color(0xFF3D82AE),
  ),
  ProductModel(
    id: 2,
    title: "Belt Bag",
    price: 234.0,
    size: 8,
    description:
        "The Belt Bag is a versatile and trendy accessory that adds flair to any outfit. Whether you're going out for a casual day or a night on the town, this bag has you covered. It features a convenient size, making it a great choice for carrying your essentials.",
    image: "assets/images/bag_2.png",
    color: const Color(0xFFD3A984),
  ),
  ProductModel(
    id: 3,
    title: "Hang Top",
    price: 234.0,
    size: 10,
    description:
        "The Hang Top bag is a chic and spacious companion for your everyday needs. Its neutral color and modern design make it a versatile addition to your wardrobe. With ample space, it's perfect for carrying all your essentials with ease.",
    image: "assets/images/bag_3.png",
    color: const Color(0xFF989493),
  ),
  ProductModel(
    id: 4,
    title: "Old Fashion",
    price: 234.0,
    size: 11,
    description:
        "The Old Fashion bag is a timeless classic that never goes out of style. Crafted with attention to detail, this bag combines vintage charm with modern functionality. Its warm, earthy tones add a touch of sophistication to your look.",
    image: "assets/images/bag_4.png",
    color: const Color(0xFFE6B398),
  ),
  ProductModel(
    id: 5,
    title: "Office Code",
    price: 234.0,
    size: 12,
    description:
        "The Office Code bag, now in a different color! Make a statement with this vibrant red bag, perfect for adding a pop of color to your professional ensemble. Its design remains the same, combining style and practicality seamlessly.",
    image: "assets/images/bag_5.png",
    color: const Color(0xFFFB7883),
  ),
  ProductModel(
    id: 6,
    title: "Minimalist Gray",
    price: 234.0,
    size: 12,
    description:
        "The Minimalist Gray bag is the epitome of simplicity and elegance. With its neutral gray color and understated design, it's the ideal choice for those who appreciate the beauty of minimalism. This bag is a versatile addition to your collection.",
    image: "assets/images/bag_6.png",
    color: const Color(0xFFAEAEAE),
  ),
];
