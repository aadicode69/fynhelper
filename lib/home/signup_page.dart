import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  void _handleSignup() {
    if (_formKey.currentState!.validate()) {
      // On success, navigate to login
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.blue.shade900,
                Colors.blue.shade800,
                Colors.blue.shade400,
              ],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create Account",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Welcome to FynHelper",
                          style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 32),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              shadowColor: Colors.blue.shade100,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 24, horizontal: 16),
                                child: Column(
                                  children: [
                                    buildInput(
                                      label: "Full Name",
                                      controller: _nameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter your name';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    buildInput(
                                      label: "Email",
                                      controller: _emailController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter your email';
                                        }
                                        if (!RegExp(
                                                r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                                            .hasMatch(value)) {
                                          return 'Enter a valid email';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    buildInput(
                                      label: "Password",
                                      controller: _passController,
                                      isPassword: true,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter password';
                                        }
                                        if (value.length < 6) {
                                          return 'Minimum 6 characters required';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    buildInput(
                                      label: "Confirm Password",
                                      controller: _confirmPassController,
                                      isPassword: true,
                                      validator: (value) {
                                        if (value != _passController.text) {
                                          return 'Passwords do not match';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Image.asset('assets/images/login-ill.png',
                                height: 180),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: _handleSignup,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue.shade900,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  elevation: 4,
                                  shadowColor: Colors.blueAccent,
                                ),
                                child: Text(
                                  "Sign Up",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account?",
                                    style: GoogleFonts.comfortaa(color: Colors.grey)),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pushNamed(context, '/login'),
                                  child: Text(
                                    "Sign in",
                                    style: GoogleFonts.comfortaa(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInput({
    required String label,
    required TextEditingController controller,
    String? Function(String?)? validator,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
      ),
    );
  }
}
