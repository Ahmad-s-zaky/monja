// ignore_for_file: use_build_context_synchronously, camel_case_types

import 'package:flutter/material.dart';
import 'package:myapp/screens/register_screen.dart';

import '../models/user.dart';
import '../services/api_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obsecureText = true;

  final ApiServices _apiServices = ApiServices();

  void _togglePasswordVisibility() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  void _login() async {
    final user = User(
      email: _emailController.text,
      password: _passwordController.text,
      phoneNumber: '',
      name: '',
      guidAplication: '',
      role: '',
      companyGuid: '',
    );

    try {
      final result = await _apiServices.loginUser(user);

      if (result.isNotEmpty) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Gagal: ${e.toString()}')),
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
              // Logo Monja
              Image.asset(
                alignment: Alignment.center,
                'assets/images/logoMonja.png',
                width: 80,
                height: 80,
              ),

              // Form Input email dan Password
              const SizedBox(height: 75),
              _formInput(),
              _textLupaPassword(),
              const SizedBox(height: 30),

              // Button dan kalimat 'atau'
              _buttonLogin(context),
              const SizedBox(height: 15),
              _atau(),
              const SizedBox(height: 15),
              _buttonRegister(context),
              const SizedBox(height: 5),
              _buttonGoogle()
            ],
          ),
        ),
      ),
    );
  }

  Container _atau() {
    return Container(
        alignment: Alignment.center,
        child: const Text(
            '---------------------------------- Atau ----------------------------------'));
  }

  Container _textLupaPassword() {
    return Container(
      alignment: Alignment.topRight,
      padding: const EdgeInsets.only(top: 0, right: 30),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Lupa Password',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            decoration: TextDecoration.underline,
            decorationColor: Colors.black,
            decorationThickness: 3,
            decorationStyle: TextDecorationStyle.solid,
          ),
        ),
      ),
    );
  }

  ElevatedButton _buttonGoogle() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 17, 0),
        padding: const EdgeInsets.symmetric(horizontal: 63, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Daftar dengan akun Google',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Column _formInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Masukan Email',
              hintStyle: const TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              prefixIcon: const Icon(
                Icons.email,
                color: Colors.black,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Isi Email Anda';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          child: TextFormField(
            controller: _passwordController,
            obscureText: _obsecureText,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Masukan Password',
              hintStyle: const TextStyle(fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.black,
              ),
              suffixIcon: IconButton(
                iconSize: 20,
                icon: Icon(
                    _obsecureText ? Icons.visibility : Icons.visibility_off),
                onPressed: _togglePasswordVisibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Isi Password Anda';
              }
              return null;
            },
          ),
        ),
        // Form Password
      ],
    );
  }

  ElevatedButton _buttonRegister(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 0, 140, 255),
        padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Daftar',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  ElevatedButton _buttonLogin(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _login();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 0, 255, 8),
        padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Masuk',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
