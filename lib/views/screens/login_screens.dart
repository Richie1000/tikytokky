import 'package:flutter/material.dart';
import 'package:tikytokky/views/screens/signup_screen.dart';

import '../../constants.dart';
import '../widgets/text_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController username_controller = TextEditingController();
    TextEditingController password_controller = TextEditingController();

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "TikTok",
              style: TextStyle(
                  fontSize: 35,
                  color: buttonColor,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              "Login",
              style: TextStyle(
                  fontSize: 24,
                  color: buttonColor,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(right: 20, left: 20),
                child: TextInputField(
                  hintText: "Username",
                  icon: Icons.email,
                  isPassword: false,
                  labelText: "Username",
                  controller: username_controller,
                )),
            SizedBox(
              height: 25,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(right: 20, left: 20),
                child: TextInputField(
                    hintText: "Password",
                    icon: Icons.lock,
                    isPassword: false,
                    labelText: "Password",
                    controller: password_controller)),
            SizedBox(
              height: 32,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 30,
              decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: InkWell(
                  onTap: () {},
                  child: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ))),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text(
                  "Dont Have an account?   ",
                  style: TextStyle(fontSize: 20),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ));
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 20, color: buttonColor),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
