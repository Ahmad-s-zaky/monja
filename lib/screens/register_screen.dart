// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/api_services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ApiServices _apiServices = ApiServices();

  void _register() async {
    final user = User(
      email: _emailController.text,
      password: _passwordController.text,
      phoneNumber: _phoneNumberController.text,
      name: _namaController.text,
      guidAplication: '',
      role: '',
      companyGuid: '',
    );

    try {
      final result = await _apiServices.loginUser(user);

      if (result.isNotEmpty) {
        Navigator.pushReplacementNamed(context, '/activation');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Register Gagal: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundLogin.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logoMonja.png',
                alignment: Alignment.center,
                width: 60,
                height: 60,
              ),
              const SizedBox(height: 15),
              _inputRegister(),
              const SizedBox(height: 15),
              _buttonRegister(),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _buttonRegister() {
    return ElevatedButton(
      onPressed: () {
        _register();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Daftar',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Column _inputRegister() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: TextFormField(
            controller: _namaController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Masukan Nama Anda',
              hintStyle: const TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Isi dengan Nama Anda';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: TextFormField(
            controller: _phoneNumberController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Masukan Nomor Telpon',
              hintStyle: const TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Isi dengan Nomor Telpon Anda';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Masukan Email Anda',
              hintStyle: const TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Isi dengan Email Anda';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Masukan Password Anda',
              hintStyle: const TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Isi dengan Password Anda';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
