import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_app_ui/dummy/side_menu_json.dart';
import 'package:ecommerce_app_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SideMenuPage extends StatefulWidget {
  const SideMenuPage({super.key});

  @override
  State<SideMenuPage> createState() => _SideMenuPageState();
}

class _SideMenuPageState extends State<SideMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [getHeader(), getBody(), getFooter()],
      ),
    );
  }

  Widget getHeader() {
    return SizedBox(
      height: 160,
      child: DrawerHeader(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80")),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Hey",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Text(
              "Anon",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    return Column(
        children: List.generate(sideMenuItems.length, (index) {
      if (sideMenuItems[index]['selected']) {
        return FadeInLeft(
          duration: Duration(milliseconds: 250),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: white,
                  border: Border.all(color: secondary.withOpacity(0.05)),
                  boxShadow: [
                    BoxShadow(
                        color: secondary.withOpacity(0.03),
                        blurRadius: 3.5,
                        offset: Offset(0, 5))
                  ]),
              child: ListTile(
                onTap: () {
                  
                },
                minLeadingWidth: 10,
                leading: Icon(sideMenuItems[index]['icon']),
                title: Text(
                  sideMenuItems[index]['label'],
                  style: TextStyle(fontSize: 16, color: secondary),
                ),
              ),
            ),
          ),
        );
      }
      return FadeInLeft(
        duration: Duration(
          milliseconds: index * 250,
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                      builder: (_) => sideMenuItems[index]['page']));
            },
            minLeadingWidth: 10,
            leading: Icon(sideMenuItems[index]['icon']),
            title: Text(
              sideMenuItems[index]['label'],
              style: TextStyle(fontSize: 16, color: secondary),
            ),
          ),
        ),
      );
    }));
  }

  Widget getFooter() {
    return Column(
      children: [
        Divider(),
        FadeInLeft(
          duration: Duration(milliseconds: 250),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: white,
                  border: Border.all(color: secondary.withOpacity(0.05)),
                  boxShadow: [
                    BoxShadow(
                        color: secondary.withOpacity(0.03),
                        blurRadius: 3.5,
                        offset: Offset(0, 5))
                  ]),
              child: ListTile(
                onTap: () {
                  
                },
                minLeadingWidth: 10,
                leading: Icon(
                  LineIcons.alternateSignOut,
                  color:secondary
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(fontSize: 16, color: secondary),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
