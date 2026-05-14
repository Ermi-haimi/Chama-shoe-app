import 'package:chama_chama/screen_1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Screen1(),
        ),
      ),
    ),
  );
}
