import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) => TextField(
      decoration: InputDecoration(
          hintText: "Search for Statistics",
          helperStyle:
              TextStyle(color: textColor.withOpacity(0.5), fontSize: 15),
          fillColor: secondaryColor,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          prefixIcon: Icon(Icons.search, color: textColor.withOpacity(0.5))));
}
