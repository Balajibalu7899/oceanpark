import 'package:flutter/material.dart';
import 'package:ocean_park/components/utilui/CustomSnackBar.dart';
import 'package:ocean_park/components/utilui/CustomeOutlineButton.dart';
import 'package:ocean_park/components/utilui/CustomeTextField.dart';
import 'package:ocean_park/global/colors/light_colors.dart';
import 'package:ocean_park/intros/PhoneLogin.dart';
import 'package:ocean_park/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool login = true;
  AuthService? auth;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _conformPassword = TextEditingController();
  @override
  void initState() {
    auth = Provider.of<AuthService>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/login.png"),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 15,
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).backgroundColor,
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                ),
                                side: BorderSide(
                                  color: login
                                      ? primaryColor
                                      : Theme.of(context).backgroundColor,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              login = true;
                            });
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: login
                                  ? primaryColor
                                  : Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .color,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 15,
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).backgroundColor,
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(0),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                ),
                                side: BorderSide(
                                  color: !login
                                      ? primaryColor
                                      : Theme.of(context).backgroundColor,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              login = false;
                            });
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: !login
                                  ? primaryColor
                                  : Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardTheme.color,
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 2),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).cardTheme.shadowColor!,
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomeTextField(
                          controller: _emailController,
                          label: "Email",
                          hinttext: "Enter Email Address",
                        ),
                        CustomeTextField(
                            controller: _passwordController,
                            label: "Password",
                            hinttext: "Enter Password"),
                        login == false
                            ? CustomeTextField(
                                controller: _conformPassword,
                                label: "Confirm Password",
                                hinttext: "Re-Enter Password",
                              )
                            : Text(""),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: login
                              ? CustomeOutlineButton(
                                  title: "Login",
                                  tap: () async {
                                    bool log = await auth!.login(
                                        _emailController.text,
                                        _passwordController.text);
                                    if (log) {
                                      customeSnackBar(
                                          context, "Successfully loggedIn");
                                    } else {
                                      customeSnackBar(
                                          context, "Unable to LogIn");
                                    }
                                  },
                                )
                              : CustomeOutlineButton(
                                  title: "SignUp",
                                  tap: () async {
                                    bool log = await auth!.signIn(
                                        _emailController.text,
                                        _passwordController.text);
                                    if (log) {
                                      customeSnackBar(
                                          context, "Successfully SignedIn");
                                    } else {
                                      customeSnackBar(context,
                                          "Unable to SigniIn try with diffrent mail id");
                                    }
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                "OR",
                style: Theme.of(context).textTheme.headline2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        Text(
                          "phone",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return PhoneLogin();
                          },
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/google.jpg",
                          height: 30,
                          width: 40,
                        ),
                        Text(
                          "Google",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.headline1!.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).backgroundColor,
                    ),
                    onPressed: () {
                      auth!.googleSignin();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
