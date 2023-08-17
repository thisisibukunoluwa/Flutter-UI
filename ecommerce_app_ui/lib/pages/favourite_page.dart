import 'package:ecommerce_app_ui/dummy/favourite_json.dart';
import 'package:ecommerce_app_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: const Size.fromHeight(60)),
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
      title: const Text(
        "Favourite",
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
              LineIcons.trash,
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
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Wrap(
                spacing: 20,
                runSpacing: 20,
                children: List.generate(favouriteJson.length, (index) {
                  return Column(
                    children: [
                      Container(
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
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        width: favouriteJson[index]['active']
                                            ? 1.2
                                            : 0,
                                        color: favouriteJson[index]['active']
                                            ? secondary.withOpacity(0.5)
                                            : Colors.transparent)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, bottom: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            LineIcons.star,
                                            size: 20,
                                            color: secondary,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3),
                                            child: Text(
                                              favouriteJson[index]['rate'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color:
                                                    secondary.withOpacity(0.12),
                                                blurRadius: 5,
                                                offset: const Offset(0, 5)),
                                          ],
                                          shape: BoxShape.circle,
                                          color: white,
                                        ),
                                        child: const Center(
                                            child: Icon(
                                          LineIcons.heart,
                                          size: 15,
                                          color: secondary,
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: -10,
                              child: Container(
                                  width: (size.width - 50) / 2,
                                  height: 180,
                                  child: Image.asset(
                                    favouriteJson[index]['image'],
                                    fit: BoxFit.cover,
                                  )),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Column(
                        children: [
                          Text(favouriteJson[index]['name'],style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                          )),
                          Container(
                            width: (size.width - 60) / 2,
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                padding: EdgeInsets.only(top:3),
                                child: Text("\$",style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: red,
                                  fontSize: 13
                                  )),
                                ),
                                 SizedBox(width: 1),
                                Text(favouriteJson[index]['price'],
                                      style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: secondary.withOpacity(0.5)))
                              ]
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }))
          ],
        ));
  }

  Widget getFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            color: secondary, borderRadius: BorderRadius.circular(12)),
        child: const Center(
          child: Text(
            "Add to Cart",
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: white),
          ),
        ),
      ),
    );
  }
}
