import 'package:chat_app/services/auth.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/views/chatRoomScreen.dart';
import 'package:chat_app/views/signin.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  final Function toogle;
  SignUp(this.toogle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  signMeUp() {
    if (formKey.currentState.validate()) {
      Map<String, String> userInfoMap = {
        'name': userNameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      };

      setState(() {
        isLoading = true;
      });

      authMethods
          .signUpWithEmailAndPassword(
              emailController.text, passwordController.text)
          .then((val) {
            
        databaseMethods.uploadUserInfo(userInfoMap);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatRoom()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarMain(context),
      ),
      body: isLoading
          ? Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 70,
                height: 110,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 5),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Creating account...',
                        style: GoogleFonts.prompt(
                            textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ))),
                    SizedBox(
                      width: 10,
                    ),
                    CircularProgressIndicator(
                      color: Colors.pink,
                      backgroundColor: Colors.blue,
                    ),
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 90,
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Form(
                        key: formKey,
                        child: Column(children: [
                          TextFormField(
                              controller: userNameController,
                              validator: (val) {
                                return val.isEmpty || val.length < 3
                                    ? 'Please provide a valid username'
                                    : null;
                              },
                              style: simpleTextStyle(),
                              decoration: textFieldInputDecoration('username')),
                          SizedBox(height: 8),
                          TextFormField(
                              validator: (val) {
                                return RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(val)
                                    ? null
                                    : 'Please provide a valid email';
                              },
                              controller: emailController,
                              style: simpleTextStyle(),
                              decoration: textFieldInputDecoration('email')),
                          SizedBox(height: 8),
                          TextFormField(
                              obscureText: true,
                              validator: (val) {
                                return val.length > 5
                                    ? null
                                    : 'Please provide a password of 6+ characters';
                              },
                              controller: passwordController,
                              style: simpleTextStyle(),
                              decoration: textFieldInputDecoration('password')),
                        ]),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            'Forget Password?',
                            style: simpleTextStyle(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                          onTap: () {
                            signMeUp();
                          },
                          child: customButton1(context, 'Sign Up')),
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
                                  textStyle: TextStyle(
                                      fontSize: 16, color: Colors.white))),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.toogle();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'SignIn now',
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 16, color: Colors.white),
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
