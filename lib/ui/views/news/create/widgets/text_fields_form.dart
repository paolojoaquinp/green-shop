
import 'package:flutter/material.dart';
import 'package:green_shop/ui/constants/constants.dart';
import 'package:green_shop/ui/views/news/create/create_news_controller.dart';

Widget textFieldTitle(CreateNewsController controller) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
    decoration: BoxDecoration(
        color: primaryPurpleOpacity,
        borderRadius: BorderRadius.circular(30)),
    child: TextField(
      controller: controller.titleController,
      decoration: const InputDecoration(
          hintText: 'Titulo',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
          hintStyle: TextStyle(color: primaryPurple),
          prefixIcon: Icon(
            Icons.title,
            color: primaryWhite,
          )),
    ),
  );
  }

  Widget textFieldDescription(CreateNewsController controller) {
    return Container(
      height: 300,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: primaryPurpleOpacity,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: controller.descController,
        decoration: const InputDecoration(
            hintText: 'Descripcion',
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            hintStyle: TextStyle(color: primaryPurple),
            prefixIcon: Icon(
              Icons.description,
              color: primaryWhite,
            )),
      ),
    );
  }