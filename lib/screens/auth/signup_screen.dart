import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mygardenapp/consts/login_img_screen.dart';
import 'package:mygardenapp/screens/auth/auth_button.dart';
import 'package:mygardenapp/screens/auth/google_button.dart';
import 'package:mygardenapp/screens/auth/login_screen.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const routeName = "/SignupScreen";
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //define input from user control
  final _emailTextController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  // dispose texteditingcontroller
  @override
  void dispose() {
    // TODO: implement dispose
    _fullNameController.dispose();
    _emailTextController.dispose();
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  // form submit for login of user
  void _submitFormRegister() {
    final isValid = _formKey.currentState!.validate();
    // unfocus on editControl after user submit
    FocusScope.of(context).unfocus();

    // handle form of user with validation
    if (isValid) {
      _formKey.currentState!.save();
    }
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
            padding: const EdgeInsets.all(22.0),
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
                TextWidget(
                  text: "สร้างบัญชีเเล้วไปลุยกันเลย",
                  color: color,
                  fontsize: 18,
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // fullname from user
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_emailFocusNode),
                        keyboardType: TextInputType.name,
                        controller: _fullNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "กรุณากรอกชื่อของคุณ";
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'ชื่อของคุณ',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Email
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_passwordFocusNode),
                        controller: _emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return "กรุณากรอกอีเมลล์ของคุณให้ถูกต้องน๊า";
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
                        onEditingComplete: _submitFormRegister,
                        controller: _passwordTextController,
                        obscureText: _obscureText,
                        focusNode: _passwordFocusNode,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.isEmpty ||
                              value.length < 10 ||
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
                AuthButton(
                  authFunction: () {},
                  textbtn: "สร้างบัญชีผู้ใช้",
                ),
                const SizedBox(
                  height: 10,
                ),
                // login with googleAPI
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
                  text: TextSpan(
                      text: "มีบัญชีผู้ใช้อยู่เเล้ว",
                      style: const TextStyle(
                          color: Colors.white10,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                      children: [
                        TextSpan(
                            text: "เข้าสู่ระบบ",
                            style: const TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                    context, LoginScreen.routeName);
                              }),
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
