import 'package:flutter/material.dart';
import './widgets/body_sign_up.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: BodySignUp(),
      ),
    );
  }
}
