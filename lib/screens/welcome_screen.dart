import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_flutter/screens/login_screen.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:flash_chat_flutter/widgets/button_layout.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = "/welcome-screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // animation = CurvedAnimation(
    //   parent: controller!,
    //   curve: Curves.decelerate,
    // );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller!);

    controller?.forward();

    // animation?.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller?.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller?.forward();
    //   }
    // });

    controller?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation?.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      speed: const Duration(milliseconds: 200),
                      textStyle: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 48.0),
            ButtonLayout(
              text: "Login",
              color: Colors.lightBlueAccent,
              onTap: () {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              },
            ),
            ButtonLayout(
              text: "Register",
              color: Colors.blueAccent,
              onTap: () {
                Navigator.of(context).pushNamed(RegistrationScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
