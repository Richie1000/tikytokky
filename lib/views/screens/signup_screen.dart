import 'package:flutter/material.dart';
import 'package:tikytokky/views/screens/login_screens.dart';

import '../../constants.dart';
import '../widgets/text_input.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController username_controller = TextEditingController();
    TextEditingController password_controller = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Center(
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
                  "Signup",
                  style: TextStyle(
                      fontSize: 24,
                      color: buttonColor,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 25,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("assets/defaultpic.jpg"),
                    ),
                    Positioned(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_a_photo),
                      ),
                      bottom: -10,
                      left: 80,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 20, left: 20),
                    child: TextInputField(
                      hintText: "username",
                      icon: Icons.person,
                      isPassword: false,
                      labelText: "Username",
                      controller: password_controller,
                    )),
                SizedBox(
                  height: 25,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 20, left: 20),
                    child: TextInputField(
                      hintText: "Email",
                      icon: Icons.email,
                      isPassword: false,
                      labelText: "Email",
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
                      isPassword: true,
                      labelText: "Password",
                      controller: password_controller,
                    )),
                SizedBox(
                  height: 25,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 20, left: 20),
                    child: TextInputField(
                      hintText: "Repeat Password",
                      icon: Icons.lock,
                      isPassword: true,
                      labelText: "Repeat Password ",
                      controller: password_controller,
                    )),
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Text(
                      "Already Have an Account?   ",
                      style: TextStyle(fontSize: 20),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const LoginScreen())));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20, color: buttonColor),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
