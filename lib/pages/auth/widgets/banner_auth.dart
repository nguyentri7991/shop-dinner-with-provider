import 'package:flutter/material.dart';

class BannerAuth extends StatelessWidget {
  const BannerAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Image.asset("assets/image/logo_auth.jpg"),
    );
  }
}
