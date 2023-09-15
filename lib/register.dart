import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterPage();
  }
}

class _RegisterPage extends State<RegisterPage> {
  bool showPassword = true;
  final _usernameController = TextEditingController();
  final _phoneOrEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  void backLogin() {
    Navigator.pop(context);
  }

  void handleRegister() {

  }

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
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: backLogin, icon: const Icon(Icons.arrow_back))
              ],
            ),
            const Text("Register",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 20),
                        child: TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'UserName',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: TextField(
                          controller: _phoneOrEmailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email or phone number',
                          ),
                        ),
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: showPassword,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: changeShowPassword,
                            icon: showPasswordIcon,
                          ),
                          labelText: 'Password',
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: handleRegister,
                          child: const Text('Login in'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
