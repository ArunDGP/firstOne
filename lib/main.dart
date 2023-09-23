import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/main_screen.dart';
import 'package:flutter_application_1/ViewModel/data_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataViewModel(), 
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mobile App for Mobitech',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

