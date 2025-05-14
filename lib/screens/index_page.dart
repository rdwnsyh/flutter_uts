import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Key untuk form validation
  final _formKey = GlobalKey<FormState>();
  // Controller untuk mengelola input field
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    // Membersihkan controller saat widget dihapus
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  // Menampilkan dialog setelah submit form
  void _showSubmitDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Informasi Submission'),
            content: Text(
              'Halo, ${_nameController.text}! Email Anda adalah ${_emailController.text}.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  // Menutup dialog dan navigasi ke halaman terima kasih
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    '/thanks',
                    arguments: _nameController.text,
                  );
                },
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Praktikum'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      // LayoutBuilder untuk membuat tampilan responsif
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: Container(
                  // Membatasi lebar maksimum container
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Responsive layout berdasarkan lebar layar
                      if (constraints.maxWidth > 600)
                        // Layout untuk layar lebar (tablet/desktop)
                        Row(
                          children: [
                            Expanded(child: _buildNameField()),
                            const SizedBox(width: 16),
                            Expanded(child: _buildEmailField()),
                          ],
                        )
                      else
                        // Layout untuk layar sempit (mobile)
                        Column(
                          children: [
                            _buildNameField(),
                            const SizedBox(height: 16),
                            _buildEmailField(),
                          ],
                        ),
                      const SizedBox(height: 24),
                      _buildSubmitButton(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget untuk field nama dengan validasi
  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(
        labelText: 'Nama',
        hintText: 'Masukkan nama Anda',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Nama tidak boleh kosong';
        }
        return null;
      },
    );
  }

  // Widget untuk field email dengan validasi
  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Masukkan email Anda',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email tidak boleh kosong';
        }
        if (!value.contains('@') || !value.contains('.')) {
          return 'Format email tidak valid';
        }
        return null;
      },
    );
  }

  // Widget tombol submit dengan validasi
  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _showSubmitDialog();
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text('Submit', style: TextStyle(fontSize: 16)),
    );
  }
}
