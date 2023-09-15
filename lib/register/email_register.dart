import 'package:flutter/material.dart';
import 'package:words_record/home.dart';

class EmailRegisterPage extends StatefulWidget {
  const EmailRegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _EmailRegisterPage();
  }
}

class _EmailRegisterPage extends State<EmailRegisterPage> {
  bool showPassword = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  void backLogin() {
    Navigator.pop(context);
  }

  void handleRegister() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
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
                const Text("Email Register",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email address',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: TextField(
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
                          ),
                          TextField(
                            controller: _confirmPasswordController,
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
