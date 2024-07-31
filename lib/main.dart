//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:BudgetBuddy/login.dart';
import 'package:BudgetBuddy/home.dart';
import 'package:BudgetBuddy/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      //'Verificatoin': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'register':(context) =>MyRegister(),
      'home':(context)=>homepage(),
    },
  ));
}