import 'package:flutter/material.dart';

import '../../constants.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController username_controller = TextEditingController();
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();

  bool isLogin = false;

  void changeAuth() {
    setState(() {
      isLogin = !isLogin;
    });
    print(isLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "TikTok",
                      style: TextStyle(
                          fontSize: 35,
                          color: buttonColor,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      isLogin ? "Login" : "Sign Up",
                      style: TextStyle(
                          fontSize: 24,
                          color: buttonColor,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    if (isLogin == false)
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                AssetImage("assets/defaultpic.jpg"),
                          ),
                          Positioned(
                            child: IconButton(
                              onPressed: () => authController.pickImage(),
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
                    TextFormField(
                      controller: email_controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Email",
                        labelText: "Email",
                        labelStyle: const TextStyle(fontSize: 20),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: borderColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: borderColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (!isLogin)
                      TextFormField(
                        controller: username_controller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          hintText: "Username",
                          labelText: "Username",
                          labelStyle: const TextStyle(fontSize: 20),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: borderColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: borderColor),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: password_controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "password",
                        labelText: "Password",
                        labelStyle: const TextStyle(fontSize: 20),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: borderColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: borderColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 30,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: InkWell(
                        onTap: !isLogin
                            ? () => authController.register(
                                username_controller.text,
                                email_controller.text,
                                password_controller.text,
                                authController.profilePhoto)
                            : () => authController.login(email_controller.text,
                                password_controller.text),
                        child: Center(
                          child: Text(
                            isLogin ? "Login" : "Register",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    if (isLogin)
                      Row(
                        children: [
                          //if (isLogin)
                          Text(
                            !isLogin ? "  " : "Already Have an Account?   ",
                            style: TextStyle(fontSize: 20),
                          ),

                          InkWell(
                            // onTap: () {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: ((context) => const LoginScreen())));
                            // },
                            onTap: changeAuth,
                            child: Text(
                              "Register",
                              style:
                                  TextStyle(fontSize: 20, color: buttonColor),
                            ),
                          ),
                        ],
                      ),
                    if (!isLogin)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: changeAuth,
                              child: Text(
                                "Login",
                                style:
                                    TextStyle(fontSize: 20, color: buttonColor),
                              ))
                        ],
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
