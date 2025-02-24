import 'package:flutter/material.dart';

class TodayTasksPage extends StatelessWidget {
  const TodayTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "Today Tasks",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.add, color: Colors.black, size: 18),
                SizedBox(width: 4),
                Text(
                  "Add",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const Text("Results", style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "5",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Static Task Cards (With Colored Icons)
            _taskCard(
              Icons.work,
              Colors.blue, // Work Task Icon Color
              "Work Task",
              "Go to supermarket to buy some milk & eggs",
              "Future",
              Colors.grey,
            ),
            _taskCard(
              Icons.work,
              Colors.blue,
              "Work Task",
              "Go to supermarket to buy some milk & eggs",
              "Done",
              Colors.green,
            ),
            _taskCard(
              Icons.home,
              Colors.pink, // Home Task Icon Color
              "Home Task",
              "Add new feature for Do It app and commit it",
              "Done",
              Colors.green,
            ),
            _taskCard(
              Icons.person,
              Colors.purple, // Personal Task Icon Color
              "Personal Task",
              "Improve my English skills by trying to speak",
              "In Progress",
              Colors.orange,
            ),
            _taskCard(
              Icons.home,
              Colors.pink,
              "Home Task",
              "Add new feature for Do It app and commit it",
              "Done",
              Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _taskCard(
    IconData icon,
    Color iconColor,
    String category,
    String task,
    String status,
    Color statusColor,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 24, color: iconColor), // Colored Icon
              const SizedBox(width: 8),
              Text(
                category,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: statusColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  status,
                  style: TextStyle(color: statusColor, fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(task, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
