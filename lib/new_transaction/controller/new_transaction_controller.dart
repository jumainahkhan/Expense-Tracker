import 'package:expense_tracker/home/model/home_model.dart';
import 'package:flutter/material.dart';

class NewTransactionController extends ChangeNotifier {
  final List<String> categoryTypes = [
    'Shopping',
    'Food',
    'Transport',
    'Bills',
    'Entertainment',
    'Grocery',
    'Health',
    'Luxury',
  ];

  final TextEditingController amountController = TextEditingController();

  String _selectedCategory = '';
  String get selectedCategory => _selectedCategory;
  void setSelectedCategory(String value) {
    _selectedCategory = value;
    notifyListeners();
  }

  HomeModel onContinueClicked() {
    HomeModel expenseData = HomeModel(
      value: int.parse(amountController.text),
      category: _selectedCategory,
      date: DateTime.now(),
    );
    return expenseData;
  }
}
