import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
      
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.onSecondary,
      ),
      cardTheme:const CardTheme().copyWith(
        //color: kColorScheme.onPrimaryFixedVariant,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      )
      
    ), //its better to change color from start better to use .copyWith() and apply to some parts 
    home: const Expenses(),
  ));
}
