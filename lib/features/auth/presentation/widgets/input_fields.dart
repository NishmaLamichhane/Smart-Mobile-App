import 'package:flutter/material.dart';

TextFormField inputFields({
    required BuildContext context,
    required String hintText,
    required String labelText,
    required IconData icon,
    TextEditingController? controller,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
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
      onSaved: onSaved,
      validator: validator,
      keyboardType: TextInputType,
      obscureText: obscure,
    );
  }