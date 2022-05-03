import 'package:flutter/material.dart';
import '../provider/sign_in_pr.dart';
import '../../../widgets/button_item.dart';
import 'package:provider/provider.dart';

class InputSignIn extends StatefulWidget {
  const InputSignIn({Key? key}) : super(key: key);

  @override
  _InputSignInState createState() => _InputSignInState();
}

class _InputSignInState extends State<InputSignIn> {
  TextEditingController _phoneField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  _formProvider() {
    final provider = Provider.of<SignInProvider>(context, listen: false);
    _phoneField = TextEditingController(text: provider.getPhoneNumber);
    _passwordField = TextEditingController(text: provider.getPassword);
  }

  @override
  void initState() {
    super.initState();
    _formProvider();
  }

  @override
  void dispose() {
    _phoneField.dispose();
    _passwordField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInProvider>(builder: (context, signIn, child) {
      return SizedBox(
        child: Column(
          children: [
            TextField(
              controller: _phoneField,
              onChanged: signIn.setPhoneNumber,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                hintText: "Nhập số điện thoại",
              ),
            ),
            TextField(
              controller: _passwordField,
              onChanged: signIn.setPassword,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
                hintText: "Nhập mât khẩu",
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text("Thông Báo"),
                      content: const Text(
                        "Quên mật khẩu ",
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text(
                  "Quên mật khẩu?",
                  style: TextStyle(
                    color: Colors.orangeAccent.withOpacity(0.6),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            CustomButton(
              buttonName: "Đăng nhập".toUpperCase(),
              onTap: () {
                signIn.login();
                if (signIn.isProcessing) {

                } else {
                  Navigator.pop(context);
                }
              },
              buttonColor: Colors.orangeAccent.withOpacity(0.8),
              borderColor: Colors.white,
              buttonHeight: 0.09,
              buttonWidth: 0.6,
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    });
  }
}
