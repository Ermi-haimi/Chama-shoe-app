import 'package:chama_chama/cart_provider.dart';
import 'package:chama_chama/detailed_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            body: HomeShoeList(),
          ),
        ),
      ),
    ),
  );
}
