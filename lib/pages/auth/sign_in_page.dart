import 'package:flutter/material.dart';
import './widgets/body_sign_in.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: BodySignIn(),
      ),
    );
  }
}
