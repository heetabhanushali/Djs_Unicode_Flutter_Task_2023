import 'package:flutter/material.dart';
import 'package:unicode_task/screens/contact/contacts.dart';
import 'package:unicode_task/screens/dice%20roll/roll_the_dice.dart';
import 'package:unicode_task/screens/edit%20details/editscreen.dart';
import 'package:unicode_task/screens/home/homescreen.dart';
import 'package:unicode_task/screens/weather/weatherscreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      'home':(context) => HomeScreen(),
      'edit':(context) => EditUserDetails(),
      'weather':(context) => WeatherScreen(),
      'contact':(context) => MyContacts(),
      'dice':(context) => DiceRoll()
    },
  ));
}
