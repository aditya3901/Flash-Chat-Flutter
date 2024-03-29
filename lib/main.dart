import './screens/chat_screen.dart';
import './screens/login_screen.dart';
import './screens/registration_screen.dart';
import 'package:flutter/material.dart';
import './screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Add these two lines for using any firebase package
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // 
  runApp(FlashChat());
} 

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegistrationScreen.routeName: (context) => RegistrationScreen(),
        ChatScreen.routeName: (context) => ChatScreen(),
      },
    );
  }
}
