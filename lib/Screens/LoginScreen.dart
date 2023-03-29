import 'package:chat/Screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat/Screens/ChatScreen.dart';
import '../constants/decoration.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'Register_Screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  String email = '';
  String password = '';
  String? data = '';
  late User loggedInUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getCurrentUser();
  }

  Future<String?> getCurrentUser() async {
    FirebaseAuthentication auth = FirebaseAuthentication();
    data = await auth.registration(email: email, password: password);
    return data;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
              child: bigText(text: 'Let\'s sign you in.'),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
              child: Text(
                'Welcome back.',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            Center(
                child: Column(
              children: [
                SizedBox(
                  width: 300.0,
                  child: TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.white,
                    decoration: kTextFormFieldDecoration,
                  ),
                ),
                SizedBox(height: 18.0),
                SizedBox(
                  width: 300.0,
                  child: TextFormField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    onChanged: (value) {
                      password = value;
                    },
                    cursorColor: Colors.white,
                    decoration: kTextFormFieldDecoration.copyWith(
                        hintText: 'Enter your Password'),
                  ),
                )
              ],
            )),
            const Spacer(),
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account? '),
                      Text(
                        'Register',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 50.0),
                    child: Center(
                      child: SizedBox(
                        width: 350.0,
                        height: 50.0,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () async {
                            await getCurrentUser();
                            print(data);
                            setState(() {
                              if (data == 'Success') {
                                Navigator.pushNamed(context, ChatScreen.id);
                              }
                            });
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class LoginScreen extends StatelessWidget {
//
// }
