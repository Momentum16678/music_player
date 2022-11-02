import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:music_player/music_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final GoogleSignIn googleSignIn = GoogleSignIn();

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser == account;
      });
    });
    googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 33, 35, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(17, 21, 30, 1),
        title: Text(
          "Sign Up",
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
            const SizedBox(height: 20,),
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
                    controller: emailController,
                  ),
                )
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const Text(
                    "Username",
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
                    controller: usernameController,
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
                    controller: passwordController,
                  ),
                )
            ),
            const SizedBox(height: 45,),
            GestureDetector(
              onTap: (){
                login(emailController.text.toString(), passwordController.text.toString(), usernameController.text.toString());
              },
              child: Container(
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
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  const Text(
                    "Or Sign Up Using",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    signUpWithGoogle(context);
                  },
                  child: Image.asset("assets/images/google_icon.jpg",
                    color: Color.fromRGBO(33, 33, 35, 1),
                    height: 30,
                    width: 30,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    signInWithApple();
                  },
                  child: Image.asset("assets/images/apple_icon.jpg",
                    color: Color.fromRGBO(33, 33, 35, 1),
                    height: 30,
                    width: 30,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    signInWithFacebook();
                  },
                  child: Image.asset("assets/images/facebook_icon.jpg",
                    height: 30,
                    width: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(65, 164, 255, 0.75)
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  void login(String email, String username, String password) async {
    try{
      Response response = await post(
          Uri.parse('https://mixtaplay.herokuapp.com/users/signup'),
          body: {
            "email" : email,
            "username" : username,
            "password" : password,
          }
      );

      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data['message']);
        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const MusicScreen())));
      }else{
        print("failed");
      }
    }catch(e){
      print(e.toString());
    }
  }

  void signInWithFacebook() async {

    try {
      final LoginResult result = await FacebookAuth.instance
          .login(permissions: (['email', 'public_profile']));
      final token = result.accessToken!.token;
      print(
          'Facebook token userID : ${result.accessToken!.grantedPermissions}');
      final graphResponse = await http.get(Uri.parse(
          'https://graph.facebook.com/'
              'v2.12/me?fields=name,first_name,last_name,email&access_token=${token}'));

      final profile = jsonDecode(graphResponse.body);
      print("Profile is equal to $profile");
      try {
        final AuthCredential facebookCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);
        final userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookCredential);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MusicScreen()),
        );
      } catch (e) {
        final snackBar = SnackBar(
          margin: const EdgeInsets.all(20),
          behavior: SnackBarBehavior.floating,
          content: Text(e.toString()),
          backgroundColor: Color.fromRGBO(65, 164, 255, 0.75),
          action: SnackBarAction(
            label: 'dismiss',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      print("error occurred");
      print(e.toString());
    }
  }

  void signInWithApple() {

  }

  Future<void> signUpWithGoogle(BuildContext context) async {

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final FirebaseAuth auth = FirebaseAuth.instance;

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);

      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const MusicScreen()));
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

}





