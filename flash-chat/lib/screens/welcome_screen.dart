import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  // String id = 'welcome_screen';
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

// todo 5-2-1 with SingleTicker...
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // todo 5-1 animation initiator
  late AnimationController controller;
  // todo 5-2 init state override
  // todo 5-4
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
      //customizing animation
      // upperBound: 100.0,
      // 안먹힘
    ); //ticker provider
    // todo 5-4 parent는 animation controll로 잡아주고,
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    // todo 5-3
    controller.forward();
    // controller.reverse(from: 1);//todo 5-7-1 testing
    // todo 5-7-2 addStatusListener Method
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.addListener(() {
      setState(() {});
      // print(controller.value);
      print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo opacity
      // backgroundColor: Colors.red.withOpacity(.8),
      // backgroundColor: Colors.red.withOpacity(controller.value),
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  //todo 4-1 hero widget start
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    // height: controller.value,
                    // todo 5-6  ->
                    height: animation.value * 100,
                  ),
                ),
                const Text(
                  'Flash Chat',
                  // '${controller.value.toInt()}%', // 오류
                  style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    //Go to login screen.
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text(
                    'Register',
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
