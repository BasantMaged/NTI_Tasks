import 'package:flutter/material.dart';

class EditTaskPage extends StatefulWidget {
  const EditTaskPage({super.key});

  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  final TextEditingController _taskNameController = TextEditingController(
    text: "Grocery Shopping App",
  );
  final TextEditingController _descriptionController = TextEditingController(
    text: "Go for grocery to buy some products.",
  );

  DateTime? _startDate;
  TimeOfDay? _startTime;
  DateTime? _endDate;
  TimeOfDay? _endTime;

  Future<void> _pickDateTime(bool isStart) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        // ignore: use_build_context_synchronously
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          if (isStart) {
            _startDate = pickedDate;
            _startTime = pickedTime;
          } else {
            _endDate = pickedDate;
            _endTime = pickedTime;
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Edit Task",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
              ),
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "In Progress",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 5),
            const Text(
              "Believe you can, and you're halfway there.",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            _buildTaskGroup(),
            const SizedBox(height: 12),
            _buildTextField("Task Name", _taskNameController),
            const SizedBox(height: 12),
            _buildTextField("Description", _descriptionController, maxLines: 3),
            const SizedBox(height: 12),
            _buildDatePicker("Start Date", true),
            const SizedBox(height: 12),
            _buildDatePicker("End Date", false),
            const SizedBox(height: 20),
            _buildButton("Mark as Done", Colors.green, () {}),
            const SizedBox(height: 10),
            _buildButton("Update", Colors.black, () {}, outlined: true),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskGroup() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.home, color: Colors.pink, size: 28),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Task Group",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                "Home",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildDatePicker(String label, bool isStart) {
    DateTime? date = isStart ? _startDate : _endDate;
    TimeOfDay? time = isStart ? _startTime : _endTime;
    return GestureDetector(
      onTap: () => _pickDateTime(isStart),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_today, color: Colors.green),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  date == null
                      ? "Select Date"
                      : "${date.day}/${date.month}/${date.year}  ${time?.format(context) ?? ""}",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    String label,
    Color color,
    VoidCallback onPressed, {
    bool outlined = false,
  }) {
    return outlined
        ? OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            minimumSize: const Size(double.infinity, 35),
          ),
          child: Text(label, style: const TextStyle(fontSize: 18)),
        )
        : ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            minimumSize: const Size(double.infinity, 35),
          ),
          child: Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        );
  }
}
