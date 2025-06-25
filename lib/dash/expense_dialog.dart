import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseFormDialog extends StatefulWidget {
  final Function(String, String, bool) onSubmit;
  const ExpenseFormDialog({super.key, required this.onSubmit});

  @override
  State<ExpenseFormDialog> createState() => _ExpenseFormDialogState();
}

class _ExpenseFormDialogState extends State<ExpenseFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  bool isCredit = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.grey[100],
      title: Text(
        "Add Expense",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      content: Form(
        key: _formKey,
        child: SizedBox(
          height: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                controller: nameController,
                style: GoogleFonts.poppins(),
                decoration: InputDecoration(
                  labelText: 'Expense Name',
                  labelStyle: GoogleFonts.poppins(),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) => value!.isEmpty ? 'Enter name' : null,
              ),
              TextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                style: GoogleFonts.poppins(),
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: GoogleFonts.poppins(),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) => value!.isEmpty ? 'Enter amount' : null,
              ),
              DropdownButtonFormField<bool>(
                value: isCredit,
                items: const [
                  DropdownMenuItem(value: true, child: Text('Credit')),
                  DropdownMenuItem(value: false, child: Text('Debit')),
                ],
                onChanged: (value) => setState(() => isCredit = value!),
                decoration: InputDecoration(
                  labelText: 'Type',
                  labelStyle: GoogleFonts.poppins(),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel", style: GoogleFonts.poppins(color: Colors.red)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.onSubmit(nameController.text, amountController.text, isCredit);
              Navigator.pop(context);
            }
          },
          child: Text("Submit", style: GoogleFonts.poppins()),
        ),
      ],
    );
  }
}
