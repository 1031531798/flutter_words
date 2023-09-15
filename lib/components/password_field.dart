import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordControl;
  const PasswordField({super.key, required this.passwordControl, });
  @override
  State<StatefulWidget> createState() {
    return _PasswordField();
  }
}

class _PasswordField extends State<PasswordField> {
  bool showPassword = true;
  void changeShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }
  @override
  Widget build(BuildContext context) {
    Icon showPasswordIcon = showPassword == true
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);
    return TextField(
      controller: widget.passwordControl,
      obscureText: showPassword,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          onPressed: changeShowPassword,
          icon: showPasswordIcon,
        ),
        labelText: 'Confirm Password',
      ),
    );
  }
}