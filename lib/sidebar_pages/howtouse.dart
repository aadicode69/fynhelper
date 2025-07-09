import 'dart:ui';
import 'package:flutter/material.dart';

class HowToUsePage extends StatelessWidget {
  const HowToUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.blueAccent),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "How to Use",
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            const Text(
              "Welcome to Fynhelper 🎓",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Track your daily spending, set budgets, and manage your money smartly — all tailored for students.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),

            _glassCard(
              step: "1",
              title: "Set Your Monthly Budget",
              desc:
              "In the Profile section, enter your monthly budget. We'll automatically calculate a daily spending limit.",
            ),
            _glassCard(
              step: "2",
              title: "Customize Daily Limit",
              desc:
              "Need more flexibility? You can update your daily limit anytime from the Profile screen.",
            ),
            _glassCard(
              step: "3",
              title: "Add Daily Expenses",
              desc:
              "On the Dashboard, tap 'Add Expense'. Fill in the name, amount, and select Credit or Debit.",
            ),
            _glassCard(
              step: "4",
              title: "Track via Calendar",
              desc:
              "Explore your spending history through the Expense Calendar. Easily filter by date and month.",
            ),

            const SizedBox(height: 20),
            _glassTipCard(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _glassCard({
    required String step,
    required String title,
    required String desc,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blueAccent.withOpacity(0.2)),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  radius: 18,
                  child: Text(
                    step,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16.5,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        desc,
                        style: const TextStyle(
                          fontSize: 14.5,
                          color: Colors.black54,
                          height: 1.4,
                        ),
                      ),
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

  Widget _glassTipCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent.withOpacity(0.15),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Colors.lightBlue.withOpacity(0.2),
            ),
          ),
          child: const Row(
            children: [
              Icon(Icons.lightbulb_outline, color: Colors.blueAccent),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  "💡 Tip: Stick to your daily limit to build strong savings habits and avoid overspending!",
                  style: TextStyle(
                    fontSize: 14.5,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
