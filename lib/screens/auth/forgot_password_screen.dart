import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mygardenapp/consts/login_img_screen.dart';
import 'package:mygardenapp/screens/auth/auth_button.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/background_widget.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const routeName = '/ForgotPassword';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailTextController = TextEditingController();
  // bool _isLoading = false;
  @override
  void dispose() {
    _emailTextController.dispose();

    super.dispose();
  }

  void _forgotPassword() async {}
  @override
  Widget build(BuildContext context) {
    Size size = GlobalUtils(context).screenSize;
    return Scaffold(
      body: Stack(children: [
        Swiper(
          itemCount: LoginImageScreen.loginImage.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              LoginImageScreen.loginImage[index],
              fit: BoxFit.cover,
            );
          },
          autoplay: true,
        ),
        Container(
          color: Colors.black38,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.2,
              ),
              const BackgroundWidget(),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                  text: "ลืมรหัสผ่าน", color: Colors.white, fontsize: 30),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _emailTextController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "กรุณากรอกอีเมลล์เพื่อรีเซตรหัสผ่าน",
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white12),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white12),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              AuthButton(
                  authFunction: () {
                    _forgotPassword();
                  },
                  textbtn: "รีเซตรหัสผ่าน")
            ],
          ),
        ),
      ]),
    );
  }
}
