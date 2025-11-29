import 'package:flutter/material.dart';

class CommonWidget {
 static  ClipRRect buildButton(String text, VoidCallback onPressed) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: SizedBox(
        width: double.infinity,
        height: 45.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  static TextFormField buildTextFormField({
    required final controller,
    required String labelText,
    required IconData prefixIcon,
    IconData? suffixIcon,
    bool? obscureText,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        suffixIcon: suffixIcon != null
            ? Icon(Icons.visibility_off_outlined)
            : null,
      ),
    );
  }
}
