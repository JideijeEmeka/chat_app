import 'dart:ui';

import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  final Function toogle;
  SignIn(this.toogle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appBarMain(context),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 90,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                    style: simpleTextStyle(),
                    decoration: textFieldInputDecoration('email')),
                TextField(
                    style: simpleTextStyle(),
                    decoration: textFieldInputDecoration('password')),
                SizedBox(
                  height: 8,
                ), 
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'Forget Password?',
                      style: simpleTextStyle(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                customButton1(context, 'Sign In'),
                SizedBox(
                  height: 16,
                ),
                customButton2(context, 'Sign In with Google'),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don`t have an account?',
                        style: GoogleFonts.roboto(
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.white))),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.toogle();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Register now',
                          style: GoogleFonts.roboto(
                              textStyle:
                                  TextStyle(fontSize: 16, color: Colors.white),
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
