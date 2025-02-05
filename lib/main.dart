import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddEmployee(),
    );
  }
}

class AddEmployee extends StatelessWidget {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Add Employee",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: UnderlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: "Age",
                border: UnderlineInputBorder(),
              ),

              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 10),

            TextFormField(
              controller: salaryController,
              decoration: const InputDecoration(
                labelText: "Salary",
                border: UnderlineInputBorder(),
              ),

              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple,
                  elevation: 0,
                ),
                child: const Text("Add Employee"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
