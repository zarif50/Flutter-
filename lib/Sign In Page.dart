import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medi_reminder/ForgetPassword.dart';
import 'package:medi_reminder/SignUpPage.dart';
import 'package:medi_reminder/home_page.dart';

import 'auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final Firebaseauthservice _auth = Firebaseauthservice();
  //sign in
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/pic5.jpg'),
              fit: BoxFit.fill)), //BoxDecoration
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding:
              const EdgeInsets.only(top: 150, bottom: 20, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome Back!\n Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontFamily: "Raleway",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    height: 1.2),
              ),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage(controller: null)));
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green)),
                  child: const Text(
                    "Create Account?",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 20),
              TextField(
                controller: _email,
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _password,
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                  },
                  style:const  ButtonStyle(
                      textStyle: MaterialStatePropertyAll(
                          TextStyle(decoration: TextDecoration.underline))),
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton.extended(
                    onPressed: _signin,
                    label:const  Text('Sign In'),
                  ),
                  FloatingActionButton(onPressed: (){},child: Icon(Icons.arrow_forward),)
                ],
              ),
              const SizedBox(height: 25),
              FloatingActionButton.extended(
                  onPressed: () {},
                  icon: Image.asset(
                    'images/google.jpeg',
                    height: 20,
                    width: 20,
                  ),
                  label: const Text('Sign in with Google',
                      style: TextStyle(color: Colors.black)),
                  backgroundColor: Colors.white),
              const SizedBox(height: 15),
              FloatingActionButton.extended(
                  onPressed: () {},
                  icon: Image.asset(
                    'images/fb.jpeg',
                    height: 20,
                    width: 20,
                  ),
                  label: const Text('Sign in with Facebook',
                      style: TextStyle(color: Colors.black)),
                  backgroundColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
  void _signin()async{
    String email = _email.text;
    String password = _password.text;
    //sign up

       User? user = await _auth.signinwithemailandpassword(email, password);
  if(user!=null){
        print("User successfully logined");
         Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
    
      }else {
        print("Password don't  match");

      }
  }
}
