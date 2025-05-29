import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Reusable input field widget
  TextFormField inputFields({
    required BuildContext context,
    required String hintText,
    required String labelText,
    required IconData icon,
    required TextEditingController controller,
    bool obscure = false,
    TextInputType? textInputType,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        prefixIcon: Icon(icon),
        hintText: hintText,
        labelText: labelText,
      ),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter $labelText";
        }
        return null;
      },
      keyboardType: textInputType,
      obscureText: obscure,
    );
  }

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      if (email == "admin@gmail.com" && password == "admin123") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login successful")),
        );
        // Navigate to home or dashboard screen
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid email or password")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Smart \n Organizer",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepPurple,
                    letterSpacing: 4,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Email Field
                    inputFields(
                      context: context,
                      hintText: "Enter your email",
                      labelText: "Email",
                      icon: Icons.person_2_outlined,
                      controller: _emailController,
                      obscure: false,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20),

                    // Password Field
                    inputFields(
                      context: context,
                      hintText: "Enter your password",
                      labelText: "Password",
                      icon: Icons.lock_outline,
                      obscure: true,
                      controller: _passwordController,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 30),

                    // Login Button
                    ElevatedButton(
                      onPressed: () => _login(context),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 50),
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text("Login"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registerScreen');
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      foregroundColor: Colors.deepPurple,
                    ),
                    child: Text("Sign Up"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
