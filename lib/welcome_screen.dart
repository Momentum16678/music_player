import 'package:flutter/material.dart';
import 'package:music_player/sign_in_screen.dart';
import 'package:music_player/sign_up_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(17, 21, 30, 1),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 161.0),
            child: Text(
              "Welcome to Mixtaplay",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                  (context) =>
                     const SignUpScreen()));
            },
            child: Container(
              width: 300,
              height: 57,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(17, 21, 30, 1),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                  )
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 11.0),
                child: Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: GestureDetector(
              onTap: (){
              },
              child: Container(
                width: 381,
                height: 57,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(17, 21, 30, 1),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                      )
                    ]
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/google_icon.jpg",
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                            )
                          ]
                      ),
                      child: Text(
                        "Continue with Google",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                      (context) =>
                  const SignInScreen()));
            },
            child: const Text(
              "Sign In",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(65, 164, 255, 0.75)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
