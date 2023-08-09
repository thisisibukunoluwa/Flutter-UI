import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_app_ui/dummy/home_json.dart';
import 'package:ecommerce_app_ui/pages/side_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app_ui/theme/colors.dart';
import '../widgets/custom_slider.dart';
import '../dummy/ads_json.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: primary,
      drawer: SideMenuPage(),
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
      automaticallyImplyLeading: false,
      backgroundColor: primary,
      leading: IconButton(
        onPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
        icon: const Icon(Icons.menu, color: secondary),
      ),
      actions: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: secondary.withOpacity(0.5)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80"),
                      fit: BoxFit.cover)),
            ),
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
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Hello Anon",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        const Text(
          "Lets get something",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 20,
        ),
        getSliders(),
        const SizedBox(
          height: 20,
        ),
        getCategorySection(),
        const SizedBox(
          height: 20,
        ),
        getItemLists()
      ]),
    );
  }

  Widget getSliders() {
    return const CustomSlider(items: adsJson);
  }

  Widget getCategorySection() {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Category",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Container(
                width: (size.width - 30) * 0.7,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(categoryItems.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        height: 30,
                        decoration: pageIndex == index
                            ? const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: secondary, width: 1.5)))
                            : const BoxDecoration(),
                        child: Text(
                          categoryItems[index]['title'],
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: pageIndex == index
                                  ? secondary
                                  : secondary.withOpacity(0.5)),
                        ),
                      ),
                    );
                  })),
                )),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                child: Container(
              height: 35,
              decoration: BoxDecoration(
                  color: secondary.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(12),
                      topLeft: Radius.circular(4))),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Search...",
                      style: TextStyle(fontSize: 13),
                    )
                  ]),
            ))
          ],
        )
      ],
    );
  }

  Widget getItemLists() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: List.generate(homeJson.length, (index) {
        return Column(
          children: [
            FadeIn(
              duration: Duration(milliseconds: 1000 * index),
              child: Container(
                width: (size.width - 50) / 2,
                height: 220,
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      child: Container(
                        width: (size.width - 50) / 2,
                        height: 200,
                        decoration: BoxDecoration(
                            color: secondary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star_outline,
                                    size: 18,
                                    color: secondary,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(
                                      homeJson[index]['rate'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: secondary.withOpacity(0.15),
                                          blurRadius: 5,
                                          offset: const Offset(0, 5))
                                    ]),
                                child: const Center(
                                  child: Icon(
                                    Icons.shopping_bag_outlined,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      child: Container(
                        width: (size.width - 50) / 2,
                        height: 180,
                        child: Image.asset(homeJson[index]['image']),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  width: (size.width - 60) / 2,
                  child: Text(
                    homeJson[index]['name'],
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  width: (size.width - 60) / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Text("\$",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: red)),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      Text(homeJson[index]['price'],
                          style: TextStyle(
                            fontSize: 20,
                            color: secondary.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                          ))
                    ],
                  ),
                )
              ],
            )
          ],
        );
      }),
    );
  }
}
