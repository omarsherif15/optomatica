import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:optomatica/consts/colors.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key});

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: darkBlue,
      controller: searchController,
      decoration:  InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: lightText)
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: lightText)
        ),
        fillColor: Colors.white,
        hintText: 'Search Race Name or Country',
        hintStyle: TextStyle(color: lightText, fontSize: 16),
        suffixIcon: const Icon(Icons.search,size: 35,)
      ),

    // ),
        );
  }
}
