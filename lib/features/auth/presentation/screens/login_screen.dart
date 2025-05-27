import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  TextFormField inputFields({
    required BuildContext context,
    required String hintText,
    required String labelText,
    required IconData icon,
    bool obscure = false,
    TextInputType? TextInputType,
  }) {
    return TextFormField(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                        hintText: "Email Addrress",
                        labelText: "Email",
                      ),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      onSaved: (newValue) {},
                      validator: (value) {
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
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
