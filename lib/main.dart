import 'package:chama_chama/detailed_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: HomeShoeList(),
        ),
      ),
    ),
  );
}
