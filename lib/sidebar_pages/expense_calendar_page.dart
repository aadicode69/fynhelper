// expense_calendar_page.dart
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dummy_expense_data.dart'; // Import the dummy data file

class ExpenseCalendarPage extends StatefulWidget {
  const ExpenseCalendarPage({Key? key}) : super(key: key);

  @override
  _ExpenseCalendarPageState createState() => _ExpenseCalendarPageState();
}

class _ExpenseCalendarPageState extends State<ExpenseCalendarPage> {
  DateTime selectedDate = DateTime.now();
  DateTime focusedDate = DateTime.now();

  // Load expense data from dummy data
  late Map<DateTime, List<Expense>> expenseData;

  @override
  void initState() {
    super.initState();
    expenseData = DummyExpenseData.getExpensesByDate();
  }

  // Get expenses for selected date
  List<Expense> getExpensesForDay(DateTime day) {
    final dateKey = DateTime(day.year, day.month, day.day);
    return expenseData[dateKey] ?? [];
  }

  // Calculate total credit for selected date
  double getTotalCredit(DateTime date) {
    final expenses = getExpensesForDay(date);
    return expenses
        .where((expense) => expense.type == ExpenseType.credit)
        .fold(0.0, (sum, expense) => sum + expense.amount);
  }

  // Calculate total debit for selected date
  double getTotalDebit(DateTime date) {
    final expenses = getExpensesForDay(date);
    return expenses
        .where((expense) => expense.type == ExpenseType.debit)
        .fold(0.0, (sum, expense) => sum + expense.amount);
  }

  // Calculate net total for selected date
  double getNetTotal(DateTime date) {
    return getTotalCredit(date) - getTotalDebit(date);
  }

  // Check if a day has expenses
  bool hasExpenses(DateTime day) {
    return getExpensesForDay(day).isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final availableHeight = screenHeight - appBarHeight - statusBarHeight - 16; // 16 for safety margin

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Expense Calendar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Calendar Section with precise height calculation
          Container(
            height: availableHeight * 0.45, // Increased to 45% for better spacing
            margin: const EdgeInsets.fromLTRB(16, 4, 16, 2),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TableCalendar<Expense>(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: focusedDate,
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDate, day);
                },
                eventLoader: getExpensesForDay,
                calendarFormat: CalendarFormat.month,
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    selectedDate = selectedDay;
                    focusedDate = focusedDay;
                  });
                },
                onPageChanged: (focusedDay) {
                  setState(() {
                    focusedDate = focusedDay;
                  });
                },
                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                  defaultTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
                  weekendTextStyle: const TextStyle(color: Colors.white70, fontSize: 14),
                  todayTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  selectedTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  markerDecoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,

                  ),
                  markersMaxCount: 1,
                  markerSize: 6,
                  cellMargin: const EdgeInsets.all(3),
                  cellPadding: const EdgeInsets.all(6),
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  leftChevronIcon: const Icon(
                    Icons.chevron_left,
                    color: Colors.blue,
                    size: 20,
                  ),
                  rightChevronIcon: const Icon(
                    Icons.chevron_right,
                    color: Colors.blue,
                    size: 20,
                  ),
                  headerPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  headerMargin: const EdgeInsets.only(bottom: 8),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: Colors.white70, fontSize: 12),
                  weekendStyle: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                daysOfWeekHeight: 24,
                rowHeight: 46,
              ),
            ),
          ),

          const SizedBox(height: 2),

          // Expense List Section with remaining space
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 4),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue, width: 1),
              ),
              child: Column(
                children: [
                  // Header with expense count and totals
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.list, color: Colors.blue, size: 18),
                                const SizedBox(width: 6),
                                Text(
                                  'Expenses (${getExpensesForDay(selectedDate).length})',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (getExpensesForDay(selectedDate).isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Credit: ₹${getTotalCredit(selectedDate).toStringAsFixed(0)}',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 11,
                                ),
                              ),
                              Text(
                                'Debit: ₹${getTotalDebit(selectedDate).toStringAsFixed(0)}',
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Expense list
                  Expanded(
                    child: getExpensesForDay(selectedDate).isEmpty
                        ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.receipt_long_outlined,
                            size: 48,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'No expenses for this date',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                        : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      itemCount: getExpensesForDay(selectedDate).length,
                      itemBuilder: (context, index) {
                        final expense = getExpensesForDay(selectedDate)[index];
                        return _buildExpenseItem(expense);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpenseItem(Expense expense) {
    final bool isCredit = expense.type == ExpenseType.credit;
    final Color typeColor = isCredit ? Colors.green : Colors.red;
    final IconData typeIcon = isCredit ? Icons.add_circle : Icons.remove_circle;

    return Container(
      margin: const EdgeInsets.only(bottom: 3),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[800]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: typeColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              typeIcon,
              color: typeColor,
              size: 16,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: typeColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        isCredit ? 'Credit' : 'Debit',
                        style: TextStyle(
                          color: typeColor,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        expense.category,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '${isCredit ? '+' : '-'}₹${expense.amount.toStringAsFixed(2)}',
            style: TextStyle(
              color: typeColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}