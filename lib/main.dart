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
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme
            .primaryContainer, //const Color.fromARGB(255, 213, 156, 247),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer),
      ), //styleFrom() also like .copyWith() , its enforce to set color of elevated button to entire app
    textTheme: ThemeData().textTheme.copyWith(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 128, 34, 222),
       // color: kColorScheme.onSecondaryContainer,
        fontSize: 14,
      )
    )
    
    
    
    ), //its better to change color from start better to use .copyWith() and apply to some parts
    
    
    home: const Expenses(),
  ));
}
