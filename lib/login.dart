import 'package:flutter/material.dart';
import 'package:words_record/home.dart';
import 'package:words_record/register/email_register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  Widget logo() {
    return const Image(image: AssetImage('assets/images/login_bg.png'));
  }

  void goHome() {
    Navigator.pushNamed(context, '/');
  }

  void goRegister() {
    Navigator.pushNamed(context, '/register');
  }

  void loginHandle() {
    goHome();
  }

  void googleLogin() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              logo(),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text("Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email or phone number',
                        ),
                      ),
                    ),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      child: FilledButton(
                        onPressed: loginHandle,
                        child: const Text('Login'),
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("or sign in with"),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            image: AssetImage('assets/images/google_icon.jpeg'),
                            width: 40,
                            height: 40),
                        Text(
                          'Google',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Not register yet?"),
                        TextButton(
                            onPressed: goRegister,
                            child: const Text('Create Account')),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
