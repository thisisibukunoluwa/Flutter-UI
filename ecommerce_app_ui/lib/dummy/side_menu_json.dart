import 'package:ecommerce_app_ui/pages/cart_page.dart';
import 'package:ecommerce_app_ui/pages/favourite_page.dart';
import 'package:ecommerce_app_ui/pages/home_page.dart';
import 'package:ecommerce_app_ui/pages/order_history_page.dart';
// import 'package:ecommerce_app_ui/pages/favourite_page.dart';
// import 'package:ecommerce_app_ui/pages/my_cart_page.dart';
// import 'package:ecommerce_app_ui/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

List sideMenuItems = [
      {
        "label": "Home",
        "selected": true,
        "icon": LineIcons.home,
        "page": HomePage()
      },
      {
        "label": "My Cart",
        "selected": false,
        "icon": LineIcons.shoppingCart,
        "page": CartPage()
      },
      {
        "label": "Favourite",
        "selected": false,
        "icon": LineIcons.heart,
        "page": FavouritePage()
      },
      {
        "label": "Orders",
        "selected": false,
        "icon": LineIcons.history,
        "page": OrderHistoryPage()
      },
    ];