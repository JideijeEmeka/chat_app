import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    controller: userNameController,
                    style: simpleTextStyle(),
                    decoration: textFieldInputDecoration('username')),
                TextField(
                    controller: emailController,
                    style: simpleTextStyle(),
                    decoration: textFieldInputDecoration('email')),
                TextField(
                    controller: passwordController,
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
                customButton1(context, 'Sign Up'),
                SizedBox(
                  height: 16,
                ),
                customButton2(context, 'Sign Up with Google'),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',
                        style: GoogleFonts.roboto(
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.white))),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'SignIn now',
                      style: GoogleFonts.roboto(
                          textStyle:
                              TextStyle(fontSize: 16, color: Colors.white),
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
