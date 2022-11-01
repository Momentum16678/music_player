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
            padding: EdgeInsets.only(top: 181.0),
            child: Text(
              "Welcome to Mixtaplay",
              style: TextStyle(
                  fontSize: 32, fontWeight: FontWeight.w500, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                  (context) =>
                     const SignUpScreen()));
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
              child: Text(
                "Sign in",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                      (context) =>
                  const SignInScreen()));
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
                    height: 270,
                    width: 300,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 381,
                    height: 57,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                          )
                        ]
                    ),
                    child: Text(
                      "Sign in",
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
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Sign In",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(65, 164, 255, 0.75)
            ),
          ),

        ],
      ),
    );
  }
}
