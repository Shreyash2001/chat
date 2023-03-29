import 'package:chat/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static final String id = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  // void initalizeFirebase() async {
  //   await Firebase.initializeApp().whenComplete(() => print("completed"));
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initalizeFirebase();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    controller.forward();

    controller.addListener(
      () {
        setState(
          () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            child: Image.asset('images/WelcomeScreenImage.png'),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Container(
              child: bigText(text: 'Flash Chat Flash Communication.'),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Container(
              child: smallText(
                  text:
                      'Flash chat helps you connect with your friends faster and feel conneccted with everything around you in a second.'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: RegistrationDesign(),
          )
        ],
      )),
    );
  }
}

class RegistrationDesign extends StatefulWidget {
  const RegistrationDesign({Key? key}) : super(key: key);

  @override
  State<RegistrationDesign> createState() => _RegistrationDesignState();
}

class _RegistrationDesignState extends State<RegistrationDesign> {
  @override
  Color _buttonColorRegister = Colors.white;
  Color _buttonColorSignin = Colors.transparent;

  void changeRegisterButtonColor() {
    setState(() {
      _buttonColorRegister = Colors.white;
      _buttonColorSignin = Colors.transparent;
    });
  }

  void changeSigninButtonColor() {
    setState(() {
      _buttonColorRegister = Colors.transparent;
      _buttonColorSignin = Colors.white;
    });
  }

  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Color(0xFFEEEEEE).withOpacity(0.2),
      child: SizedBox(
        width: 300.0,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 150.0,
              height: 50.0,
              child: TextButton(
                onPressed: () {
                  changeRegisterButtonColor();
                },
                child: Text('Register'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: _buttonColorRegister,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 150.0,
              height: 50.0,
              child: TextButton(
                onPressed: () {
                  changeSigninButtonColor();
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                child: Text('Sign In'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: _buttonColorSignin,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class RegistrationDesign extends StatelessWidget {
//   const RegistrationDesign({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//   }
// }

class bigText extends StatelessWidget {
  const bigText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class smallText extends StatelessWidget {
  const smallText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 18.0,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
