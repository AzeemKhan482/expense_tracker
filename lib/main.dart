import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

    var kDarkColorScheme= ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor:const Color.fromARGB(255, 5, 99, 125),
    );
void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kDarkColorScheme,
       cardTheme: const CardTheme().copyWith(
        color: kDarkColorScheme
            .primaryContainer, //const Color.fromARGB(255, 213, 156, 247),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.primaryContainer),
      ),
    ),
    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(         //its better to change color from start better to use .copyWith() and apply to some parts
        backgroundColor: kColorScheme.onPrimaryContainer,//.copywith() doesnt change the main orignal setting its just change that specific setteing for just that thing
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
      titleLarge:const TextStyle(
        fontWeight: FontWeight.bold,
        color:  Color.fromARGB(255, 128, 34, 222),
       // color: kColorScheme.onSecondaryContainer,
        fontSize: 14,
      ),
    ),
    ), 
 // themeMode: ThemeMode.system, //default
    
    
    home: const Expenses(),
  ));
}
