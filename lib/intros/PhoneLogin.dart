import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/components/utilui/CustomeOutlineButton.dart';
import '/components/utilui/CustomeTextField.dart';
import '/services/auth_service.dart';
import 'package:provider/provider.dart';

class PhoneLogin extends StatefulWidget {
  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final formKey = new GlobalKey<FormState>();

  TextEditingController _phoneController = TextEditingController();

  TextEditingController _otpController = TextEditingController();

  String? verificationId;

  bool? codeSent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/login.png"),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 45,
                        width: 150,
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardTheme.color,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                          ),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
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
                        child: Center(
                          child: Text(
                            "Phone Login",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .fontWeight,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardTheme.color,
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
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
                              controller: _phoneController,
                              label: "Phone",
                              hinttext: "Phone Number",
                              keyboardType: TextInputType.phone,
                            ),
                            if (codeSent == true)
                              CustomeTextField(
                                controller: _otpController,
                                label: "OTP",
                                hinttext: "Enter Otp",
                                keyboardType: TextInputType.number,
                              ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: CustomeOutlineButton(
                                title: codeSent == true ? "Verify" : "Get OTP",
                                tap: () {
                                  codeSent == true
                                      ? signInWithOtp(
                                          _otpController.text.toString(),
                                          verificationId,
                                        )
                                      : verifyPhone(
                                          '+91' +
                                              _phoneController.text.toString(),
                                        );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  signIn(AuthCredential authCredential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(authCredential);
      Provider.of<AuthService>(context, listen: false).phoneAuth();
      Navigator.of(context).pop();
    } catch (err) {
      print(err);
    }
  }

  signInWithOtp(smsCode, verificationId) {
    AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    signIn(authCredential);
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential authresult) {
      signIn(authresult);
    };
    final PhoneVerificationFailed verificationFailed = (dynamic authException) {
      print(authException);
    };
    final PhoneCodeSent smsSent = (String? verId, [int? forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }
}
