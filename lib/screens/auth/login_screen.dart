import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mygardenapp/consts/login_img_screen.dart';
import 'package:mygardenapp/screens/auth/auth_button.dart';
import 'package:mygardenapp/screens/auth/google_button.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //define input from user control
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  var _obscureText = true;

  // dispose texteditingcontroller
  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordFocusNode.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  // form submit for login of user
  void _submitFormLogin() {
    final isValid = _formKey.currentState!.validate();
    // unfocus on editControl after user submit
    FocusScope.of(context).unfocus();

    // handle form of user with validation
    isValid ? print("กรุณากรอกให้ครบจ้ะ") : print("กรอกครบเเล้วจ้า");
  }

  @override
  Widget build(BuildContext context) {
    Color color = GlobalUtils(context).color;
    return Scaffold(
      body: Stack(children: [
        Swiper(
            duration: 1000,
            autoplayDelay: 3000,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                LoginImageScreen.loginImage[index],
                fit: BoxFit.cover,
              );
            },
            autoplay: true,
            itemCount: LoginImageScreen.loginImage.length),
        Container(
          color: Colors.black87,
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 120,
                ),
                TextWidget(
                  text: "ยินดีต้อนรับสู่สวนของผมครับ",
                  color: color,
                  fontsize: 30,
                  title: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_passwordFocusNode),
                        controller: _emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return "กรุณากรอกอีเมลล์ของคุณให้ถูกต้องน๊ํา";
                          } else {
                            return 'ไปกันต่อ';
                          }
                        },
                        style: TextStyle(color: color),
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: color),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: color),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: color),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () {
                          _submitFormLogin();
                        },
                        controller: _passwordTextController,
                        obscureText: _obscureText,
                        focusNode: _passwordFocusNode,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.isEmpty ||
                              value.length < 8 ||
                              value.contains(RegExp(r'[A-Za-z1-10]'))) {
                            return "กรุณาใส่รหัสผ่านของคุณให้ถูกต้อง";
                          } else {
                            return "ถูกเเล้วไปกันต่อ";
                          }
                        },
                        style: TextStyle(color: color),
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(_obscureText
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded),
                          ),
                          hintText: "รหัสผ่าน",
                          hintStyle: TextStyle(color: color),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: color),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: color),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'ลืมรหัสผ่าน',
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AuthButton(
                  authFunction: () {},
                  textbtn: "เข้าสู่ระบบ",
                ),
                const SizedBox(
                  height: 10,
                ),
                const GoogleButton(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.white10,
                        thickness: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextWidget(text: "หรือ", color: color, fontsize: 18),
                    const SizedBox(
                      width: 5,
                    ),
                    const Expanded(
                      child: Divider(
                        color: Colors.white10,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                AuthButton(authFunction: () {}, textbtn: "โหมดผู้ชม"),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text:  TextSpan(
                      text: "ไม่มีบัญชีผู้ใช้",
                      style: const TextStyle(
                          color: Colors.white10,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                      children: [
                         TextSpan(
                          text: "สร้างบัญชีผู้ใช้",
                          style: const TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                              recognizer: TapGestureRecognizer()..onTap =() {
                                
                              }
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
