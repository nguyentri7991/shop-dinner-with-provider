import 'package:flutter/material.dart';
import '../provider/sign_up_pr.dart';
import '../../../widgets/button_item.dart';
import 'package:provider/provider.dart';

class InputSignUp extends StatefulWidget {
  const InputSignUp({Key? key}) : super(key: key);

  @override
  _InputSignUpState createState() => _InputSignUpState();
}

class _InputSignUpState extends State<InputSignUp> {
  final _formKeyRegister = GlobalKey<FormState>();
  TextEditingController _nameClientField = TextEditingController();
  TextEditingController _phoneField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  TextEditingController _confirmPasswordField = TextEditingController();

  _formProvider() {
    final provider = Provider.of<SignUpProvider>(context, listen: false);
    _nameClientField = TextEditingController(text: provider.getNameClient);
    _phoneField = TextEditingController(text: provider.getPhoneNumber);
    _passwordField = TextEditingController(text: provider.getPassword);
    _confirmPasswordField =
        TextEditingController(text: provider.getConfirmPassword);
  }

  @override
  void initState() {
    super.initState();
    _formProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpProvider>(builder: (context, signUp, child) {
      return SizedBox(
        child: Form(
          key: _formKeyRegister,
          child: Column(
            children: [
              TextFormField(
                controller: _nameClientField,
                onChanged: signUp.setPhoneNumber,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  hintText: "Nhập số Họ tên",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Không được bỏ trống";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneField,
                onChanged: signUp.setPhoneNumber,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                  hintText: "Nhập số điện thoại",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Không được bỏ trống";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordField,
                onChanged: signUp.setPassword,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Không được bỏ trống";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _confirmPasswordField,
                onChanged: signUp.setConfirmPassword,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  hintText: "Nhập lại mât khẩu",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Không được bỏ trống";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              CustomButton(
                buttonName: "Đăng ký".toUpperCase(),
                onTap: () {
                  signUp.register();
                  Navigator.pop(context);
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
        ),
      );
    });
  }
}
