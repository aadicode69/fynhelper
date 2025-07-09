import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseProvider with ChangeNotifier {
  final List<Expense> _expenses = [];

  int _dailyLimit = 100; // Default value

  List<Expense> get expenses => _expenses;

  int get totalCredits =>
      _expenses.where((e) => e.isCredit).fold(0, (sum, e) => sum + e.amount);

  int get totalDebits =>
      _expenses.where((e) => !e.isCredit).fold(0, (sum, e) => sum + e.amount);

  int get dailyLimit => _dailyLimit;

  void setDailyLimit(int limit) {
    _dailyLimit = limit;
    notifyListeners();
  }

  void addExpense(String name, String amountStr, bool isCredit) {
    final amt = int.tryParse(amountStr);
    if (amt == null) return;

    _expenses.add(Expense(name: name, amount: amt, isCredit: isCredit));
    notifyListeners();
  }
}
