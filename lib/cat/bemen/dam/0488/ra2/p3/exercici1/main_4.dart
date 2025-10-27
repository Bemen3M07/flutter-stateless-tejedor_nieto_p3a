import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class Contact {
  final String fullName;
  final String email;
  final String phone;

  const Contact({
    required this.fullName,
    required this.email,
    required this.phone,
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const contact = Contact(
      fullName: 'Marta Casserres',
      email: 'correodemarta@gmail.com',
      phone: '9783674474',
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            ClipOval(
              child: Image.asset(
                'assets/bymax.jpg',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Nombre
            Text(
              contact.fullName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            Container(
              width: 300, 
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.email, color: Colors.black54, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          contact.email,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.black54, size: 20),
                      const SizedBox(width: 9),
                      Text(
                        contact.phone,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



