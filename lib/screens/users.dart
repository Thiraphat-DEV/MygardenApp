import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mygardenapp/provider/dark_theme_provider.dart';
import 'package:mygardenapp/screens/wishlist/wishlist_screen.dart';
import 'package:mygardenapp/services/global_navigate.dart';
import 'package:mygardenapp/widget/textwidget.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => UserScreenState();
}

class UserScreenState extends State<UserScreen> {
  // address input text
  final TextEditingController _addressTextController =
      TextEditingController(text: "");
  String? updateText;
  // save value from _addressTextController
  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                  text: "Hello, ",
                  style: TextStyle(
                      color: color, fontSize: 30, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Name: ",
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w200),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => print("this is call function "))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // create TextWidget function call to get all text from user
              TextWidget(
                  text: "yourEmail@email.com", color: color, fontsize: 20),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(height: 20),

              // add row lists with userLists(args) [5]
              // -1 address
              userLists(
                  title: "my Address",
                  subtitle: updateText,
                  color: color,
                  icon: IconlyLight.profile,
                  onPressed: () async {
                    await _editAddressDialog();
                  }),
              // -2  order
              userLists(
                  title: "Your Orders",
                  color: color,
                  icon: IconlyLight.bag2,
                  onPressed: () {}),
              // -3 wish of your liked
              userLists(
                  title: "Liked Product",
                  color: color,
                  icon: IconlyLight.heart,
                  onPressed: () {
                    GlobalNavigate.navigateTo(
                        context: context, routeName: WishListScreen.routeName);
                  }),
              // -4 Viewd of product
              userLists(
                  title: "Viewed Product",
                  color: color,
                  icon: IconlyLight.show,
                  onPressed: () {}),
              // -5 forgot your passwor
              userLists(
                  title: "Forgot Password",
                  color: color,
                  icon: IconlyLight.unlock,
                  onPressed: () {}),

              // Switch mode
              SwitchListTile(
                title: TextWidget(
                  text: themeState.getDarkTheme ? "Dark Mode" : "Light Mode",
                  color: color,
                  fontsize: 20,
                ),
                secondary: Icon(themeState.getDarkTheme
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined),
                onChanged: (bool value) {
                  setState(() {
                    themeState.setDarkTheme = value;
                  });
                },
                value: themeState.getDarkTheme,
              ),

              const SizedBox(
                height: 5,
              ),
              //Logout
              userLists(
                  title: "Logout",
                  color: color,
                  icon: IconlyBold.logout,
                  onPressed: () {
                    _showDialogLogout();
                  }),
              //userRow
              // userRow()
            ],
          ),
        )),
      ),
    );
  }

  // function logout with show warning dialog before user logout
  Future<void> _showDialogLogout() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(children: <Widget>[
              Image.asset(
                'assets/images/warning_logout.jpg',
                height: 30,
                width: 30,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text('Logout'),
            ]),
            content: const Text(
                'คุณต้องการออกจากระบบหรอค้าบ \n อยู่ด้วยกันก่อนน๊าา ^_^'),
            actions: [
              TextButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  child: TextWidget(
                    color: Colors.yellow.shade900,
                    text: 'ยกเลิก',
                    fontsize: 18,
                  )),
              TextButton(
                  onPressed: () {},
                  child: TextWidget(
                    color: Colors.redAccent,
                    text: 'ออกจากระบบ',
                    fontsize: 18,
                  )),
            ],
          );
        });
  }

  // function editAddressDialog with input Text from user and save to show text update with Dialog
  Future<void> _editAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Update your Address"),
            content: TextField(
              autocorrect: true,
              controller: _addressTextController,
              maxLines: 3,
              decoration: const InputDecoration(hintText: "Your Address"),
            ),
            // action for update address
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      updateText = _addressTextController.text;
                      Navigator.pop(context);
                    });
                  },
                  child: const Text("Updated"))
            ],
          );
        });
  }

  // function create list to show for users
  Widget userLists(
      {required String title,
      String? subtitle,
      required Color color,
      required IconData icon,
      required Function onPressed}) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        fontsize: 22,
      ),
      subtitle: TextWidget(
        text: subtitle ?? "", // if subtitle is null then replace with " "
        color: color,
        fontsize: 18,
      ),
      leading: Icon(icon),
      trailing: const Icon(Icons.arrow_right_sharp),
      onTap: () => onPressed(),
    );
  }

  Widget userRow() {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(children: <Widget>[
        SizedBox(
          width: 5,
        ),
        Icon(Icons.settings),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("Title"), Text('Subtitle')],
        ),
        Spacer(),
        Icon(Icons.arrow_right_sharp)
      ]),
    );
  }
}
