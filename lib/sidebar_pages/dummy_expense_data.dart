// dummy_expense_data.dart
class Expense {
  final String name;
  final ExpenseType type;
  final double amount;
  final DateTime date;
  final String category;

  Expense({
    required this.name,
    required this.type,
    required this.amount,
    required this.date,
    this.category = 'General',
  });
}

enum ExpenseType { credit, debit }

class DummyExpenseData {
  static List<Expense> getAllExpenses() {
    return [
      // June 2025 (Previous month - selected days)
      Expense(
        name: 'Freelance Payment',
        type: ExpenseType.credit,
        amount: 850.00,
        date: DateTime(2025, 6, 15),
        category: 'Income',
      ),
      Expense(
        name: 'Groceries',
        type: ExpenseType.debit,
        amount: 120.00,
        date: DateTime(2025, 6, 15),
        category: 'Food',
      ),
      Expense(
        name: 'Electric Bill',
        type: ExpenseType.debit,
        amount: 95.50,
        date: DateTime(2025, 6, 20),
        category: 'Utilities',
      ),
      Expense(
        name: 'Bonus',
        type: ExpenseType.credit,
        amount: 500.00,
        date: DateTime(2025, 6, 25),
        category: 'Income',
      ),
      Expense(
        name: 'Restaurant',
        type: ExpenseType.debit,
        amount: 85.75,
        date: DateTime(2025, 6, 25),
        category: 'Food',
      ),
      Expense(
        name: 'Gas',
        type: ExpenseType.debit,
        amount: 60.00,
        date: DateTime(2025, 6, 28),
        category: 'Transportation',
      ),

      // July 2025 (Complete month - continuous data)
      // July 1
      Expense(
        name: 'Salary',
        type: ExpenseType.credit,
        amount: 750.00,
        date: DateTime(2025, 7, 1),
        category: 'Income',
      ),
      Expense(
        name: 'Morning Coffee',
        type: ExpenseType.debit,
        amount: 8.50,
        date: DateTime(2025, 7, 1),
        category: 'Food',
      ),

      // July 2
      Expense(
        name: 'Groceries',
        type: ExpenseType.credit,
        amount: 25.00, // cashback
        date: DateTime(2025, 7, 2),
        category: 'Refund',
      ),
      Expense(
        name: 'Supermarket',
        type: ExpenseType.debit,
        amount: 145.75,
        date: DateTime(2025, 7, 2),
        category: 'Food',
      ),

      // July 3
      Expense(
        name: 'Coffee Shop',
        type: ExpenseType.debit,
        amount: 12.00,
        date: DateTime(2025, 7, 3),
        category: 'Food',
      ),
      Expense(
        name: 'Lunch',
        type: ExpenseType.debit,
        amount: 18.50,
        date: DateTime(2025, 7, 3),
        category: 'Food',
      ),

      // July 4
      Expense(
        name: 'Gas Station',
        type: ExpenseType.debit,
        amount: 55.00,
        date: DateTime(2025, 7, 4),
        category: 'Transportation',
      ),
      Expense(
        name: 'Parking Fee',
        type: ExpenseType.debit,
        amount: 15.00,
        date: DateTime(2025, 7, 4),
        category: 'Transportation',
      ),

      // July 5
      Expense(
        name: 'Freelance Project',
        type: ExpenseType.credit,
        amount: 300.00,
        date: DateTime(2025, 7, 5),
        category: 'Income',
      ),
      Expense(
        name: 'Internet Bill',
        type: ExpenseType.debit,
        amount: 65.00,
        date: DateTime(2025, 7, 5),
        category: 'Utilities',
      ),

      // July 6
      Expense(
        name: 'Breakfast',
        type: ExpenseType.debit,
        amount: 14.25,
        date: DateTime(2025, 7, 6),
        category: 'Food',
      ),
      Expense(
        name: 'Movie Tickets',
        type: ExpenseType.debit,
        amount: 32.00,
        date: DateTime(2025, 7, 6),
        category: 'Entertainment',
      ),

      // July 7
      Expense(
        name: 'Grocery Store',
        type: ExpenseType.debit,
        amount: 78.90,
        date: DateTime(2025, 7, 7),
        category: 'Food',
      ),
      Expense(
        name: 'Pharmacy',
        type: ExpenseType.debit,
        amount: 28.75,
        date: DateTime(2025, 7, 7),
        category: 'Health',
      ),

      // July 8
      Expense(
        name: 'Side Gig Payment',
        type: ExpenseType.credit,
        amount: 150.00,
        date: DateTime(2025, 7, 8),
        category: 'Income',
      ),
      Expense(
        name: 'Fast Food',
        type: ExpenseType.debit,
        amount: 22.40,
        date: DateTime(2025, 7, 8),
        category: 'Food',
      ),

      // July 9
      Expense(
        name: 'Online Shopping',
        type: ExpenseType.debit,
        amount: 89.99,
        date: DateTime(2025, 7, 9),
        category: 'Shopping',
      ),
      Expense(
        name: 'Coffee',
        type: ExpenseType.debit,
        amount: 6.50,
        date: DateTime(2025, 7, 9),
        category: 'Food',
      ),

      // July 10
      Expense(
        name: 'Refund',
        type: ExpenseType.credit,
        amount: 45.00,
        date: DateTime(2025, 7, 10),
        category: 'Refund',
      ),
      Expense(
        name: 'Dinner Out',
        type: ExpenseType.debit,
        amount: 67.80,
        date: DateTime(2025, 7, 10),
        category: 'Food',
      ),

      // July 11
      Expense(
        name: 'Uber Ride',
        type: ExpenseType.debit,
        amount: 18.50,
        date: DateTime(2025, 7, 11),
        category: 'Transportation',
      ),
      Expense(
        name: 'Lunch Meeting',
        type: ExpenseType.debit,
        amount: 42.00,
        date: DateTime(2025, 7, 11),
        category: 'Food',
      ),

      // July 12
      Expense(
        name: 'Gym Membership',
        type: ExpenseType.debit,
        amount: 45.00,
        date: DateTime(2025, 7, 12),
        category: 'Health',
      ),
      Expense(
        name: 'Protein Shake',
        type: ExpenseType.debit,
        amount: 8.75,
        date: DateTime(2025, 7, 12),
        category: 'Health',
      ),

      // July 13
      Expense(
        name: 'Weekend Groceries',
        type: ExpenseType.debit,
        amount: 156.25,
        date: DateTime(2025, 7, 13),
        category: 'Food',
      ),
      Expense(
        name: 'Gas',
        type: ExpenseType.debit,
        amount: 48.00,
        date: DateTime(2025, 7, 13),
        category: 'Transportation',
      ),

      // July 14
      Expense(
        name: 'Streaming Service',
        type: ExpenseType.debit,
        amount: 15.99,
        date: DateTime(2025, 7, 14),
        category: 'Entertainment',
      ),
      Expense(
        name: 'Book Store',
        type: ExpenseType.debit,
        amount: 29.99,
        date: DateTime(2025, 7, 14),
        category: 'Education',
      ),

      // July 15 (Exceptional day - exceeds 1000)
      Expense(
        name: 'Big Freelance Project',
        type: ExpenseType.credit,
        amount: 1200.00,
        date: DateTime(2025, 7, 15),
        category: 'Income',
      ),
      Expense(
        name: 'Phone Bill',
        type: ExpenseType.debit,
        amount: 65.00,
        date: DateTime(2025, 7, 15),
        category: 'Utilities',
      ),

      // July 16
      Expense(
        name: 'Coffee Shop',
        type: ExpenseType.debit,
        amount: 11.25,
        date: DateTime(2025, 7, 16),
        category: 'Food',
      ),
      Expense(
        name: 'Parking',
        type: ExpenseType.debit,
        amount: 12.00,
        date: DateTime(2025, 7, 16),
        category: 'Transportation',
      ),

      // July 17
      Expense(
        name: 'Restaurant Dinner',
        type: ExpenseType.debit,
        amount: 85.40,
        date: DateTime(2025, 7, 17),
        category: 'Food',
      ),
      Expense(
        name: 'Tip Refund',
        type: ExpenseType.credit,
        amount: 10.00,
        date: DateTime(2025, 7, 17),
        category: 'Refund',
      ),

      // July 18
      Expense(
        name: 'Part-time Work',
        type: ExpenseType.credit,
        amount: 180.00,
        date: DateTime(2025, 7, 18),
        category: 'Income',
      ),
      Expense(
        name: 'Groceries',
        type: ExpenseType.debit,
        amount: 92.30,
        date: DateTime(2025, 7, 18),
        category: 'Food',
      ),

      // July 19
      Expense(
        name: 'Gas Station',
        type: ExpenseType.debit,
        amount: 52.75,
        date: DateTime(2025, 7, 19),
        category: 'Transportation',
      ),
      Expense(
        name: 'Fast Food',
        type: ExpenseType.debit,
        amount: 16.80,
        date: DateTime(2025, 7, 19),
        category: 'Food',
      ),

      // July 20
      Expense(
        name: 'Weekend Trip Expense',
        type: ExpenseType.debit,
        amount: 280.00,
        date: DateTime(2025, 7, 20),
        category: 'Travel',
      ),
      Expense(
        name: 'Hotel Breakfast',
        type: ExpenseType.debit,
        amount: 25.00,
        date: DateTime(2025, 7, 20),
        category: 'Food',
      ),

      // July 21
      Expense(
        name: 'Gas for Trip',
        type: ExpenseType.debit,
        amount: 75.00,
        date: DateTime(2025, 7, 21),
        category: 'Transportation',
      ),
      Expense(
        name: 'Souvenir',
        type: ExpenseType.debit,
        amount: 18.50,
        date: DateTime(2025, 7, 21),
        category: 'Shopping',
      ),

      // July 22
      Expense(
        name: 'Cash Back',
        type: ExpenseType.credit,
        amount: 35.00,
        date: DateTime(2025, 7, 22),
        category: 'Refund',
      ),
      Expense(
        name: 'Lunch',
        type: ExpenseType.debit,
        amount: 24.75,
        date: DateTime(2025, 7, 22),
        category: 'Food',
      ),

      // July 23
      Expense(
        name: 'Online Course',
        type: ExpenseType.debit,
        amount: 99.99,
        date: DateTime(2025, 7, 23),
        category: 'Education',
      ),
      Expense(
        name: 'Coffee',
        type: ExpenseType.debit,
        amount: 7.25,
        date: DateTime(2025, 7, 23),
        category: 'Food',
      ),

      // July 24
      Expense(
        name: 'Dinner Out',
        type: ExpenseType.debit,
        amount: 55.80,
        date: DateTime(2025, 7, 24),
        category: 'Food',
      ),
      Expense(
        name: 'Uber Home',
        type: ExpenseType.debit,
        amount: 19.50,
        date: DateTime(2025, 7, 24),
        category: 'Transportation',
      ),

      // July 25 (Exceptional day - high expenses)
      Expense(
        name: 'Emergency Car Repair',
        type: ExpenseType.debit,
        amount: 850.00,
        date: DateTime(2025, 7, 25),
        category: 'Transportation',
      ),
      Expense(
        name: 'Insurance Payout',
        type: ExpenseType.credit,
        amount: 400.00,
        date: DateTime(2025, 7, 25),
        category: 'Insurance',
      ),

      // July 26
      Expense(
        name: 'Grocery Shopping',
        type: ExpenseType.debit,
        amount: 78.60,
        date: DateTime(2025, 7, 26),
        category: 'Food',
      ),
      Expense(
        name: 'Coffee Shop',
        type: ExpenseType.debit,
        amount: 9.75,
        date: DateTime(2025, 7, 26),
        category: 'Food',
      ),

      // July 27
      Expense(
        name: 'Weekend Side Job',
        type: ExpenseType.credit,
        amount: 120.00,
        date: DateTime(2025, 7, 27),
        category: 'Income',
      ),
      Expense(
        name: 'Brunch',
        type: ExpenseType.debit,
        amount: 34.50,
        date: DateTime(2025, 7, 27),
        category: 'Food',
      ),

      // July 28
      Expense(
        name: 'Pharmacy',
        type: ExpenseType.debit,
        amount: 42.25,
        date: DateTime(2025, 7, 28),
        category: 'Health',
      ),
      Expense(
        name: 'Fast Food',
        type: ExpenseType.debit,
        amount: 13.80,
        date: DateTime(2025, 7, 28),
        category: 'Food',
      ),

      // July 29
      Expense(
        name: 'Freelance Payment',
        type: ExpenseType.credit,
        amount: 450.00,
        date: DateTime(2025, 7, 29),
        category: 'Income',
      ),
      Expense(
        name: 'Dinner with Friends',
        type: ExpenseType.debit,
        amount: 72.40,
        date: DateTime(2025, 7, 29),
        category: 'Food',
      ),

      // July 30
      Expense(
        name: 'Gas Station',
        type: ExpenseType.debit,
        amount: 58.00,
        date: DateTime(2025, 7, 30),
        category: 'Transportation',
      ),
      Expense(
        name: 'Coffee',
        type: ExpenseType.debit,
        amount: 6.25,
        date: DateTime(2025, 7, 30),
        category: 'Food',
      ),

      // July 31
      Expense(
        name: 'Month End Bonus',
        type: ExpenseType.credit,
        amount: 200.00,
        date: DateTime(2025, 7, 31),
        category: 'Income',
      ),
      Expense(
        name: 'Celebration Dinner',
        type: ExpenseType.debit,
        amount: 95.75,
        date: DateTime(2025, 7, 31),
        category: 'Food',
      ),

      // August 2025 (Next month - few days)
      Expense(
        name: 'Salary Advance',
        type: ExpenseType.credit,
        amount: 800.00,
        date: DateTime(2025, 8, 1),
        category: 'Income',
      ),
      Expense(
        name: 'Monthly Groceries',
        type: ExpenseType.debit,
        amount: 165.50,
        date: DateTime(2025, 8, 1),
        category: 'Food',
      ),
      Expense(
        name: 'Electric Bill',
        type: ExpenseType.debit,
        amount: 98.75,
        date: DateTime(2025, 8, 3),
        category: 'Utilities',
      ),
    ];
  }

  static Map<DateTime, List<Expense>> getExpensesByDate() {
    final Map<DateTime, List<Expense>> expenseMap = {};

    for (var expense in getAllExpenses()) {
      final dateKey = DateTime(expense.date.year, expense.date.month, expense.date.day);

      if (expenseMap.containsKey(dateKey)) {
        expenseMap[dateKey]!.add(expense);
      } else {
        expenseMap[dateKey] = [expense];
      }
    }

    return expenseMap;
  }
}