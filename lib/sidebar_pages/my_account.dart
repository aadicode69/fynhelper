import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/exxpense_provider.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  TextEditingController limitController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  int? budget;
  bool isVisible = false;
  bool isVisible2 = false;

  Widget customBox(String title, String value) {
    return Container(
      width: 180,
      height: 100,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: const Border(
          left: BorderSide(
            color: Colors.black,
            width: 4,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Text(
            'My Account',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/dashboard');
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/my.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Ethan Carter',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'aadityagoyal@gmail.com',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customBox("Pocket Money", "₹${budget ?? 0}"),
                          const SizedBox(width: 16),
                          customBox("Per Day Limit", "₹${expenseProvider.dailyLimit}"),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Divider(
                        thickness: 2,
                        color: Colors.grey.shade300,
                        indent: 46,
                        endIndent: 46,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customBox("Credits", "₹${expenseProvider.totalCredits}"),
                          const SizedBox(width: 16),
                          customBox("Debits", "₹${expenseProvider.totalDebits}"),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Add Budget',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      isVisible2 = true;
                                    });
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                                    side: const BorderSide(color: Colors.black26, width: 1.5),
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    elevation: 4,
                                    shadowColor: Colors.black.withOpacity(0.5),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.add, size: 18, color: Colors.white),
                                      const SizedBox(width: 6),
                                      Text(
                                        'Add Amount',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.5,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            if (isVisible2)
                              TextField(
                                controller: budgetController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  hintText: 'Enter your budget',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      final value = int.tryParse(budgetController.text);
                                      if (value != null) {
                                        setState(() {
                                          budget = value;
                                          isVisible2 = false;
                                        });
                                        print('Budget of the month is : $budget');
                                      } else {
                                        print('Invalid value entered');
                                      }
                                    },
                                    icon: const Icon(Icons.check, color: Colors.black),
                                  ),
                                ),
                              )
                            else
                              const SizedBox.shrink(),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      isVisible = true;
                                    });
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                                    side: const BorderSide(color: Colors.black26, width: 1.5),
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    elevation: 4,
                                    shadowColor: Colors.black.withOpacity(0.5),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Add Amount',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.5,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      const Icon(Icons.add, size: 18, color: Colors.white),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Set Daily Limit',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            if (isVisible)
                              TextField(
                                controller: limitController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  hintText: 'Enter Daily Limit',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      final value = int.tryParse(limitController.text);
                                      if (value != null) {
                                        expenseProvider.setDailyLimit(value);
                                        print('Daily limit set to : $value');
                                      } else {
                                        print('Invalid number entered');
                                      }
                                      setState(() {
                                        isVisible = false;
                                      });
                                    },
                                    icon: const Icon(Icons.check, color: Colors.black),
                                  ),
                                ),
                              )
                            else
                              const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
