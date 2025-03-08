import 'package:flutter/material.dart';
import 'package:flutter_application_2/customer_information/customer.dart';
import 'package:flutter_application_2/customer_information/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bantu mobile',
      theme: ThemeData(
        
      
  
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/customer',
      routes: {
        '/home': (context) =>  Home(),
        '/customer': (context) => const Customer(),
      },
    );
  }
}
