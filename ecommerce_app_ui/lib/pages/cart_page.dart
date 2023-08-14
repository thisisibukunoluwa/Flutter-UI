import 'package:ecommerce_app_ui/theme/colors.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
        child: getAppBar(),
        preferredSize: Size.fromHeight(60),
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
       title: const Text(
        "Cart",
        style: TextStyle(
            fontSize: 18, color: secondary, fontWeight: FontWeight.w500),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: secondary.withOpacity(0.2))),
          child: const Center(
              child: Icon(
            Icons.arrow_back,
            size: 15,
            color: secondary,
          )),
        ),
      ),
    );
  }
}
