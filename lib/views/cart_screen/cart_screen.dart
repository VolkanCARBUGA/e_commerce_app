import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: redColor,
      child: "Sepetinizde Ürün yok".text.fontFamily(semibold).color(whiteColor).makeCentered(),
    );
  }
}