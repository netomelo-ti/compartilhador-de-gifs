import 'package:compartilhador_de_gifs/pages/android/home_page_android.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePageAndroid(),
    ),
  );
}
