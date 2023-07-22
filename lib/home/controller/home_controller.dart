import 'package:expense_tracker/home/model/home_model.dart';

import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    getBalance();
  }

  int _currentBalance = 0;
  int get currentBalance => _currentBalance;
  void setCurrentBalanace(int value) {
    _currentBalance = value;
    notifyListeners();
  }

  final List<HomeModel> _listOfTransactions = [
    HomeModel(
      value: 500,
      category: "Food",
      date: DateTime.now(),
    ),
    HomeModel(
      value: 500,
      category: "Shopping",
      date: DateTime.now(),
    ),
    HomeModel(
      value: 500,
      category: "Laundry",
      date: DateTime.now(),
    ),
    HomeModel(
      value: 500,
      category: "Transportation",
      date: DateTime.now(),
    ),
  ];
  List<HomeModel> get listOfTransactions => _listOfTransactions;
  void addTransaction(HomeModel model) {
    _listOfTransactions.add(model);
    notifyListeners();
  }

  void getBalance() {
    Future.delayed(const Duration(seconds: 5), () {
      setCurrentBalanace(1000);
    });
    notifyListeners();
  }
}
