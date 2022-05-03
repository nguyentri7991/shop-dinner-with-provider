import 'package:flutter/material.dart';
import '../auth/provider/sign_in_pr.dart';
import 'package:provider/provider.dart';
import '../auth/sign_in_page.dart';
import '../home/widgets/body.dart';
import '../products/products_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SignInProvider>(builder: (context, signIn, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            signIn.isProcessing ? "Đăng Nhập" : signIn.getAuthModel!.name,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInPage(),
              ),
            ),
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: const BodyHomePage(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ShopPage(),
            ),
          ),
          child: const Icon(Icons.navigation),
          backgroundColor: Colors.green,
        ),
      );
    });
  }
}
