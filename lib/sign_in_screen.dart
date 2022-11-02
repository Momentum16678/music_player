import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 33, 35, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(17, 21, 30, 1),
        title: Text(
          "Sign In",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const Text(
                    "Email",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 18),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(17, 21, 30, 1)
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.start,
                  ),
                )
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const Text(
                    "Password",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 18),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(17, 21, 30, 1)
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.start,
                  ),
                )
            ),
            const SizedBox(height: 45,),
            Container(
              width: 320,
              height: 60,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(17, 21, 30, 1)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  "Sign Up",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),

          ],
        ),
      ),

    );
  }
}
