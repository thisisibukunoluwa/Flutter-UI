import 'package:elearning_app_ui/constants/color.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search,color: Colors.grey,size:26),
        suffixIcon: Icon(Icons.mic,color: kPrimaryColor,size:26),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: 'Search your topic',
        labelStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        ),
        isDense: true 
      ),
    );
  }
}
