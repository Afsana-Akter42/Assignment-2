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
      home: ContactList(),

    );
  }
}

class ContactList extends StatefulWidget {
  const ContactList({super.key});
  @override
  ContactListState createState() => ContactListState();
}

class ContactListState extends State<ContactList> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  List<Map<String, String>> contacts = [];


  void addContact() {
    String name = nameController.text.trim();
    String number = numberController.text.trim();

    if (name.isNotEmpty && number.isNotEmpty) {
      setState(() {
        contacts.add({"name": name, "number": number});
      });

      nameController.clear();
      numberController.clear();
    }
  }

  void deleteContact(int index) {

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirmation"),
          content: const Text("Are you sure for delete?"),

          actions: [
            IconButton(
              icon: const Icon(Icons.no_sim_outlined, color: Colors.blue),
              onPressed: () => Navigator.pop(context),
            ),

            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.blue),
              onPressed: () {
                setState(() {
                  contacts.removeAt(index);
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Contact List"),
        backgroundColor: Colors.blueGrey,
      ),


      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),

              ),
            ),

            const SizedBox(height: 10),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Number",
                border: OutlineInputBorder(),

              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: addContact,

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,

                ),

                minimumSize: const Size(
                    double.infinity, 50
                ),
              ),

              child: const Text("Add"),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(

                itemCount: contacts.length,
                itemBuilder: (context, index) {

                  return Card(
                    elevation:3,

                    child: ListTile(
                      leading: const Icon(Icons.person),

                      title: Text(
                        contacts[index] ["name"]!,

                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red

                        ),
                      ),

                      subtitle: Text(contacts[index]["number"]!),
                      trailing: const Icon(Icons.call, color: Colors.blue),
                      onLongPress: () => deleteContact(index),

                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//




