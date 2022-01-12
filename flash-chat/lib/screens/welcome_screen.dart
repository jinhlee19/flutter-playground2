import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // Todo 7-1, 2
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  // String id = 'welcome_screen';
  static const String id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

// todo 5-2-1 with SingleTicker...
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // todo 5-1 animation initiator
  // todo 5-2 init state override
  // todo 5-4
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this
            // customizing animation
            // upperBound: 100.0
            ); //ticker provider
    // // todo 5-4 parent는 animation controller로 잡아주기
    // animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
// todo 5-7-2 addStatusListener Method
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
    // todo 5-3
    controller.forward();
    // controller.reverse(from: 1);//todo 5-7-1 testing
    // todo 5-8
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    // todo 5-5?
    controller.addListener(() {
      setState(() {});
      // print(controller.value);
      // print(animation.value);
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
      backgroundColor: animation.value,

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
                    height: 60,
                  ),
                ),
                //todo 7-3
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Flash Chat',
                        textStyle: kTitleTextStyle,
                        speed: Duration(milliseconds: 300))
                  ],
                  totalRepeatCount: 1,
                  // TypewriterAnimatedTextKit(
                  //   text: ['Flash Chat'],
                  //   // '${controller.value.toInt()}%', // 오류
                  //   textStyle: TextStyle(
                  //       fontSize: 35.0,
                  //       fontWeight: FontWeight.w900,
                  //       color: Colors.black87),
                  // ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.blue,
              title: 'Log in',
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: 'Register',
              color: Colors.lightBlue,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
