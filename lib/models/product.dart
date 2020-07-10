import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  bool status;
  Product(
      {this.id,
      this.image,
      this.title,
      this.price,
      this.description,
      this.size,
      this.color,
      this.status});
}

List<Product> products2 = [
  Product(
      id: 1,
      title: "小炒肉",
      price: 23,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_2_1.png",
      color: Color(0xFF3D82AE),
      status: true),
  Product(
      id: 2,
      title: "炖牛骨",
      price: 44,
      size: 8,
      description: dummyText,
      image: "assets/images/bag_3_1.png",
      color: Color(0xFFD3A984),
      status: false),
  Product(
      id: 3,
      title: "番茄炒蛋",
      price: 16,
      size: 10,
      description: dummyText,
      image: "assets/images/bag_1_1.png",
      color: Color(0xFF989493),
      status: true),
  Product(
      id: 4,
      title: "鲜骨浓汤锅",
      price: 34,
      size: 11,
      description: dummyText,
      image: "assets/images/bag_2_1.png",
      color: Color(0xFFE6B398),
      status: false),
  Product(
      id: 5,
      title: "Office Code",
      price: 24,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_2_1.png",
      color: Color(0xFFFB7883),
      status: true),
  Product(
      id: 6,
      title: "Office Code",
      price: 26,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_6.png",
      color: Color(0xFFAEAEAE),
      status: true),
];

List<Product> products = [
  Product(
      id: 1,
      title: "牛油菌汤锅",
      price: 55,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_1_1.png",
      color: Color(0xFF3D82AE),
      status: true),
  Product(
      id: 2,
      title: "番茄清汤锅",
      price: 34,
      size: 8,
      description: dummyText,
      image: "assets/images/bag_2_1.png",
      color: Color(0xFFD3A984),
      status: false),
  Product(
      id: 3,
      title: "嫩羊肉卷",
      price: 33,
      size: 10,
      description: dummyText,
      image: "assets/images/bag_3_1.png",
      color: Color(0xFF989493),
      status: true),
  Product(
      id: 4,
      title: "菌汤牛油鸳鸯锅",
      price: 24,
      size: 11,
      description: dummyText,
      image: "assets/images/bag_1_1.png",
      color: Color(0xFFE6B398),
      status: false),
  Product(
      id: 5,
      title: "Office Code",
      price: 24,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_2_1.png",
      color: Color(0xFFFB7883),
      status: true),
  Product(
      id: 6,
      title: "Office Code",
      price: 24,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_1_1.png",
      color: Color(0xFFAEAEAE),
      status: true),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
