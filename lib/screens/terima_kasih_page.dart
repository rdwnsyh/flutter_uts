import 'package:flutter/material.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil data nama yang dikirim dari halaman sebelumnya
    final String name =
        ModalRoute.of(context)?.settings.arguments as String? ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Terima Kasih'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Text(
          'Terima kasih telah mengisi form, $name!',
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
