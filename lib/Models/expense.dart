import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter= DateFormat.yMd();    //DateFormat class provided by intl third party package, and yMd constructer function 

const uuid= Uuid();          // flutter Uuid third party package for genrate unique ID's, run it on terminal
enum Category{food, travel , leisure , work}                  // enum" its allow us to contained a fixed set of values

const categoryTcons={                        //using Map for keys and their values
Category.food: Icons.lunch_dining,
Category.travel: Icons.flight_takeoff,
Category.leisure:Icons.movie,
Category.work:Icons.work,
};


class Expense {
  Expense({
    required this.tittle, 
    required this.amount, 
    required this.date,
    required this.category,
    }): id = uuid.v4();      //initializer lists" can be used to initialize class properties(like id) with values that are not received as constructer function arguments.
                              // v4 method genrate String unique ID's .....

  final String id;
  final String tittle;
  final String amount;
  final DateTime date;
  final Category category;

  String get formattedDate{
    return formatter.format(date);
  }
}
