import 'package:flutter/cupertino.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterPage();
  }
}

class _RegisterPage extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Text("Register",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20)),
        ],
      ),
    );
  }
}