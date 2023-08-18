import 'package:ecommerce_app_ui/dummy/order_json.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ecommerce_app_ui/theme/colors.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: getAppBar(), preferredSize: const Size.fromHeight(60)),
      bottomNavigationBar: getFooter(),
      body: getBody(),
      backgroundColor: primary,
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
              LineIcons.ad,
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
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          getTabs(),
          SizedBox(
            height: 30,
          ),
          pageIndex == 0 ? getCurrentOrderItemsList() : Container()
        ],
      ),
    );
  }

  Widget getTabs() {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        setState(() {
          pageIndex = 0;
        });
      },
      child: Container(
        width: size.width,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: secondary.withOpacity(0.05)),
        child: Row(children: [
          pageIndex == 0
              ? Flexible(
                  child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Container(
                    width: (size.width - 45) / 2,
                    height: 50,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: secondary.withOpacity(0.15),
                              blurRadius: 5,
                              offset: Offset(0, 5))
                        ]),
                    child: Center(
                      child: Text(
                        "Current Orders",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ))
              : Container()
        ]),
      ),
    );
  }

  Widget getFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            color: secondary, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            "Reorder",
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: white),
          ),
        ),
      ),
    );
  }

  Widget getCurrentOrderItemsList() {
    var size = MediaQuery.of(context).size;
    return Column(
        children: List.generate(currentOrderList.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          height: 200,
          width: size.width,
          decoration: BoxDecoration(
              color: secondary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(currentOrderList[index]['date'],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                    Text("Delivery Processing",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.orangeAccent)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: size.width * 0.6,
                      child: Row(children: [
                        Container(
                          width: 90,
                          height: 90,
                          child: Stack(
                            children: [
                              Positioned(
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: secondary.withOpacity(0.1)),
                                      color: white),
                                ),
                              ),
                              Container(
                                width: 80,
                                height: 80,
                                child: Image.asset(
                                    currentOrderList[index]['image']),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentOrderList[index]['name'],
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              maxLines: 2,
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$",
                                  style: TextStyle(fontSize: 16,
                                  color: red,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                   currentOrderList[index]['price'],
                                  style: TextStyle(fontSize: 16,
                                  color: red,fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ))
                      ]),
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Container(
                            width: 1,
                            height: 60,
                            decoration: BoxDecoration(
                              color: secondary.withOpacity(0.15)
                            ),
                          ),
                          SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Items: 1",style:TextStyle(
                                fontSize: 13
                              )),
                              Text(currentOrderList[index]['time'],style:TextStyle(
                                fontSize: 12,
                                color: secondary.withOpacity(0.5)
                              )),
                            ],
                          )
                        ],
                      )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }));
  }
}
