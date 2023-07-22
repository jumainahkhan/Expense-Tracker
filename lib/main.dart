import 'package:expense_tracker/home/controller/home_controller.dart';
import 'package:expense_tracker/home/view/home_view.dart';
import 'package:expense_tracker/new_transaction/controller/new_transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomeController()),
    ChangeNotifierProvider(create: (context) => NewTransactionController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 5, 98, 164)),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
