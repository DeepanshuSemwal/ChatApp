import 'package:chat/screens/login_screen.dart';
import 'package:chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {

  static const String id='welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
 late  AnimationController controller;
 late Animation animation;

  void initState()
  {

    controller=AnimationController(duration: Duration(seconds: 1), vsync: this);
    //animation=CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation=ColorTween(begin: Colors.blue,end: Colors.purple).animate(controller);

    controller.forward();
    animation.addStatusListener((status) {

      if(status==AnimationStatus.completed)
        {
          controller.reverse(from: 0.1);
        }
      else if(status==AnimationStatus.dismissed)
        {
            controller.forward();
        }

    });
   /* controller.addListener(() {

      setState(()
      {

      });
      //print(animation.value);
    });*/

    @override
    void dispose()
    {
      controller.dispose();
      super.dispose();
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                   child: Image.asset('images/logo.png'),

                    height: 20.0,
                  ),
                ),

                AnimatedTextKit(

                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flash Chat',
                        textStyle: const TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w900,
                        ),
                        speed: const Duration(milliseconds: 200),
                      ),
                    ]


                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            
            RoundButton(color: Colors.lightBlueAccent, tittle: 'Log in', onPress:(){
              Navigator.pushNamed(context, LoginScreen.id);
            }

            ),
            
           RoundButton(color: Colors.blueAccent, tittle: 'Register', onPress:() {

                   Navigator.pushNamed(context, RegistrationScreen.id);

           }
           ),
          ],
        ),
      ),
    );
  }
}








