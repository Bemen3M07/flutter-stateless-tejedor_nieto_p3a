import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class Contact {
  final String fullName;
  final String email;
  final String phone;
  const Contact({required this.fullName, required this.email, required this.phone});
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const contact = Contact(
      fullName: 'Marta Casserres',
      email: 'marta@example.com',
      phone: '934748474',
    );

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactScreen(contact: contact),
    );
  }
}

class ContactScreen extends StatelessWidget {
  final Contact contact;
  const ContactScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 40),

            ClipOval(
              child: Image.asset(
                'bymax.jpg', 
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              contact.fullName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              width: 300,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const _ContactDetails(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactDetails extends StatelessWidget {
  const _ContactDetails();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.email, color: Colors.black54, size: 20),
            SizedBox(width: 8),
            Expanded(child: Text('correomartaa@gmail.com', style: TextStyle(fontSize: 16))),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Icon(Icons.phone, color: Colors.black54, size: 20),
            SizedBox(width: 8),
            Text('934748474', style: TextStyle(fontSize: 16)),
          ],
        ),
      ],
    );
  }
}




