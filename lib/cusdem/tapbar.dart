import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(String title) {
  return AppBar(
      toolbarHeight: 30,
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 80, 73, 72),
      title: Text(
        title,
        style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      ));
}
