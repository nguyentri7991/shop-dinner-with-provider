import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../sign_up_page.dart';
import '../widgets/banner_auth.dart';
import '../widgets/input_sign_in.dart';
import '../../../pages/home/home_page.dart';
import '../../../widgets/button_item.dart';

class BodySignIn extends StatefulWidget {
  const BodySignIn({Key? key}) : super(key: key);

  @override
  _BodySignInState createState() => _BodySignInState();
}

class _BodySignInState extends State<BodySignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, top: 100),
      padding: const EdgeInsets.only(left: 15, right: 15),
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.88,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(2),
          bottomLeft: Radius.circular(2),
          bottomRight: Radius.circular(2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const BannerAuth(),
            const InputSignIn(),
            const SizedBox(height: 40),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Chưa có tài khoản? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "Đăng ký ngay",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              buttonName: "Về trang chính",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              ),
              buttonColor: Colors.white,
              borderColor: Colors.white,
              buttonHeight: 0.1,
              buttonWidth: 0.8,
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
