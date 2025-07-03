import 'package:flutter/material.dart';
import 'package:fynhelper/dash/expense_dialog.dart';
import 'package:fynhelper/dash/navbar.dart';
import 'package:fynhelper/providers/exxpense_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final int perDayLimit = 100;

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    final expenses = expenseProvider.expenses;
    final totalDebits = expenseProvider.totalDebits;
    final limitReached = totalDebits > perDayLimit;

    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text(
          "FynHelper",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout, color: Colors.black),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/banner.png'),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade700, width: 1.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "  Add Expense",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => ExpenseFormDialog(
                              onSubmit: (name, amount, isCredit) {
                                expenseProvider.addExpense(name, amount, isCredit);
                              },
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          side: const BorderSide(color: Color(0xFF1565C0), width: 1.5),
                          backgroundColor: const Color(0xFF1565C0),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(0.2),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.add, size: 18, color: Colors.white),
                            const SizedBox(width: 6),
                            Text(
                              "Add Amount",
                              style: GoogleFonts.poppins(
                                fontSize: 14.5,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: limitReached ? Colors.red.shade100 : Colors.green.shade100,
                    border: Border.all(
                      color: limitReached ? Colors.red : Colors.green,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        limitReached ? Icons.warning : Icons.check_circle,
                        color: limitReached ? Colors.red : Colors.green,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          limitReached
                              ? "Alert! Daily limit of ₹$perDayLimit exceeded."
                              : "You're within the daily limit of ₹$perDayLimit.",
                          style: GoogleFonts.poppins(
                            fontSize: 14.5,
                            fontWeight: FontWeight.w500,
                            color: limitReached ? Colors.red.shade900 : Colors.green.shade900,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(16),
                  height: 600,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                    color: Colors.blue.shade50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Today's Expenses",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: expenses.isEmpty
                            ? const Center(child: Text("No expenses yet"))
                            : ListView.separated(
                          itemCount: expenses.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final expense = expenses[index];
                            return Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    expense.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "₹${expense.amount}",
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    expense.isCredit ? "Credit" : "Debit",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                      color: expense.isCredit ? Colors.green : Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
