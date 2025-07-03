import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  File? _image;
  final picker = ImagePicker();

  final _formKey = GlobalKey<FormState>();
  final _controllers = {
    'fullName': TextEditingController(),
    'contact': TextEditingController(),
    'email': TextEditingController(),
    'shipping': TextEditingController(),
    'home': TextEditingController(),
    'license': TextEditingController(),
    'vehicle': TextEditingController(),
  };

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    for (var key in _controllers.keys) {
      _controllers[key]!.text = prefs.getString(key) ?? '';
    }

    final imageBase64 = prefs.getString('profileImage');
    if (imageBase64 != null) {
      final bytes = base64Decode(imageBase64);
      setState(() => _image = File.fromRawPath(bytes));
    }
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    for (var key in _controllers.keys) {
      await prefs.setString(key, _controllers[key]!.text);
    }

    if (_image != null) {
      final bytes = await _image!.readAsBytes();
      final base64Image = base64Encode(bytes);
      await prefs.setString('profileImage', base64Image);
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Information saved successfully')),
    );
  }

  Future<void> _pickImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _image = File(picked.path));
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Information')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? const Icon(Icons.camera_alt, size: 40)
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              ..._controllers.entries.map((entry) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      controller: entry.value,
                      decoration: InputDecoration(
                        labelText: _capitalize(entry.key),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  )),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _saveData,
                icon: const Icon(Icons.save),
                label: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _capitalize(String key) {
    return key
        .replaceAllMapped(RegExp(r'([A-Z])'), (m) => ' ${m[0]}')
        .replaceFirstMapped(RegExp(r'^[a-z]'), (m) => m[0]!.toUpperCase());
  }
}
