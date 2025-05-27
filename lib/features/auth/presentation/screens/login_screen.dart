import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // Reusable inputFields widget
  TextFormField inputFields({
    required BuildContext context,
    required String hintText,
    required String labelText,
    required IconData icon,
    required TextEditingController controller,
    bool obscure = false,
    TextInputType? TextInputType,
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
      onSaved: (newValue) {},
      validator: (value) {
        return null;
      },
      keyboardType: TextInputType,
      obscureText: obscure,
    );
  }

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      // Example hardcoded credentials
      if (email == "admin@gmail.com" && password == "admin123") {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Login successful")));
        // Navigate to home or dashboard
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Invalid email or password")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 100.0,
          ),
          // padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Smart \n Organizer",
                style: TextStyle(
                  fontSize: 32,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  color: Colors.deepPurple,
                  letterSpacing: 10,
                ),
              ),
              SizedBox(height: 30),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        prefixIcon: Icon(Icons.person_2_outlined),
                        hintText: "Email your email",
                        labelText: "Email",
                      ),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      onSaved: (newValue) {},
                      validator: (value) {
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      controller: _emailController,
                    ),
                    SizedBox(height: 20),
                    // Using the reusable inputFields widget for Password
                    inputFields(
                      context: context,
                      hintText: "Enter your password",
                      labelText: "Password",
                      icon: Icons.lock_outline,
                      obscure: true,
                      controller: _passwordController,
                      TextInputType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _login(context),
                      child: Text("Login"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 50), //width and height
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
