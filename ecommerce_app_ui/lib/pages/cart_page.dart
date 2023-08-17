import 'package:ecommerce_app_ui/dummy/my_cart_json.dart';
import 'package:ecommerce_app_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:line_icons/line_icons.dart';

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
        preferredSize: const Size.fromHeight(60),
      ),
      body: getBody(),
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
        onPressed: () {},
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
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: secondary.withOpacity(0.12),
                    blurRadius: 5,
                    offset: const Offset(0, 5)),
              ],
              shape: BoxShape.circle,
              color: white,
            ),
            child: const Center(
                child: Icon(
              LineIcons.shoppingBag,
              size: 15,
              color: secondary,
            )),
          ),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        getCartLists(),
        const SizedBox(
          height: 20,
        ),
        getPromotionCode(),
        const SizedBox(height: 20),
        getSummary(),
        getFooter()
      ]),
    );
  }

  Widget getCartLists() {
    var size = MediaQuery.of(context).size;
    return Column(
        children: List.generate(myCartJson.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(children: [
          Container(
            width: (size.width - 30) * 0.7,
            height: 80,
            child: Row(
              children: [
                Stack(children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(myCartJson[index]["image"]),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: secondary.withOpacity(0.2)),
                          color: secondary.withOpacity(0.1)),
                    ),
                  )
                ]),
                const SizedBox(width: 10),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      myCartJson[index]['name'],
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 2,
                    ),
                    Row(
                      children: [
                        const Text("\$",
                            style: TextStyle(
                                color: red,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        Text(myCartJson[index]['price'],
                            style: const TextStyle(
                                color: red,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
          const SizedBox(width: 15),
          Flexible(
            child: Container(
              height: 80,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.close,
                      size: 15,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(LineIcons.minusSquare),
                      Text(
                        "1",
                        style: TextStyle(fontSize: 14),
                      ),
                      Icon(LineIcons.plus)
                    ],
                  )
                ],
              ),
            ),
          )
        ]),
      );
    }));
  }

  Widget getPromotionCode() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          color: secondary.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: secondary.withOpacity(0.3))),
      child: Row(
        children: [
          Container(
            width: (size.width - 30) * 0.7,
            height: 55,
            child: const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                cursorColor: secondary,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Promo code"),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: secondary),
                child: const Center(
                  child: Text(
                    "Apply",
                    style: TextStyle(color: white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("Subtotal",
                style: TextStyle(
                    fontSize: 16,
                    color: secondary,
                    fontWeight: FontWeight.bold)),
            const SizedBox(width: 2),
            const Text("(3 items)",
                style: TextStyle(color: secondary, fontSize: 16)),
            const SizedBox(
              width: 5,
            ),
            Dash(
              length: 155,
              direction: Axis.horizontal,
              dashLength: 15,
              dashColor: secondary.withOpacity(0.5),
            ),
            const SizedBox(width: 5),
            const SizedBox(width: 5),
            const Wrap(
              children: [
                Text("\$600",
                    style: TextStyle(
                      color: secondary,
                      fontSize: 16,
                    )),
              ],
            )
          ],
        ),
        SizedBox(height: 30),
        Row(
          children: [
            const Text("Delivery Charge",
                style: TextStyle(
                    fontSize: 16,
                    color: secondary,
                    fontWeight: FontWeight.bold)),
            const SizedBox(width: 2),
            const SizedBox(
              width: 5,
            ),
            Dash(
              length: 155,
              direction: Axis.horizontal,
              dashLength: 15,
              dashColor: secondary.withOpacity(0.5),
            ),
            const SizedBox(width: 5),
            const SizedBox(width: 5),
            const Wrap(
              children: [
                Text("Free",
                    style: TextStyle(
                      color: secondary,
                      fontSize: 16,
                    )),
              ],
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            const Text("Total",
                style: TextStyle(
                    fontSize: 16,
                    color: secondary,
                    fontWeight: FontWeight.bold)),
            const SizedBox(width: 2),
            const SizedBox(
              width: 5,
            ),
            Dash(
              length: 260,
              direction: Axis.horizontal,
              dashLength: 15,
              dashColor: secondary.withOpacity(0.5),
            ),
            const SizedBox(width: 5),
            const SizedBox(width: 5),
            const Wrap(
              children: [
                Text("\$600",
                    style: TextStyle(
                      color: red,
                      fontSize: 16,
                    )),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget getFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: secondary,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(
          child: Text("Proceed to checkout",style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: white
          ),),
        ),
      ),
    );
  }
}
