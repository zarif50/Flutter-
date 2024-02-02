import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medi_reminder/Sign%20In%20Page.dart';

import 'auth.dart';

class SignUpPage extends StatefulWidget {
  final controller;
  const SignUpPage({super.key,required this.controller});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final Firebaseauthservice _auth = Firebaseauthservice();
//text editing controller
  final namecontroller = TextEditingController();
  final usernamecontroller = TextEditingController();

  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  @override
  void dispose() {
    namecontroller.dispose();
    usernamecontroller.dispose();
    passwordcontroller.dispose();
    confirmpasswordcontroller.dispose();
    super.dispose();
  }

  String _name = '';
  String _email = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'SignUpPage',
      home: Builder(
        builder: (context) => Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/pic5.jpg'),
                  fit: BoxFit.fill)), //BoxDecoration
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(
                  top: 150, bottom: 20, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Create new \n Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: "Raleway",
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        height: 1.2),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green)),
                      child: const Text(
                        "Already Registered?Login",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(height: 15),
                  Column(
                    children: [
                      TextFormField(
                        controller: namecontroller,
                          onChanged: (value) => _name = value,
                          decoration: InputDecoration(

                              hintText: 'Name',
                              labelText: 'Please enter your Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      const SizedBox(height: 20),
                      TextFormField(
                          validator: (input) {
                            if (input == null &&
                                input!.contains('@gmail.com')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        controller: usernamecontroller,
                          onChanged: (value) => _email = value,
                          decoration:InputDecoration(
                              hintText: 'Email',
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                              ),
                          ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                          validator: (input) {
                            if (input!.length < 6) {
                              return 'Your password need to be 6 character';
                            }
                            return null;
                          },
                          controller: passwordcontroller,
                          onChanged: (value) => _password = value,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      const SizedBox(height: 20),
                      TextFormField(
                          validator: (input) {
                            if (input != _password) {
                              return 'Your password need to be matched with previous one';
                            }
                            return null;
                          },
                          controller: confirmpasswordcontroller,
                          onChanged: (value) => _password = value,
                          decoration: InputDecoration(
                              hintText: 'Confirm password',
                              labelText: 'confirm Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton.extended(
                          onPressed: _signup,
                          label: const Text('Sign Up'),
                        ),
                        FloatingActionButton(
                            onPressed: () {},
                            child: const Icon(Icons.arrow_forward)),
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _signup()async{
    String email = usernamecontroller.text;
    String password = passwordcontroller.text;
    //sign up
    if (namecontroller.text.isNotEmpty &&
        usernamecontroller.text.isNotEmpty &&
        passwordcontroller.text.isNotEmpty &&
        confirmpasswordcontroller.text.isNotEmpty) {
      if (passwordcontroller.text == confirmpasswordcontroller.text) {
        await _auth.signupwithemailandpassword(email, password);

        print("Password  match");
       // Navigator.pushNamed(context, '/product_page');
      }else {
        print("Password don't  match");

    }} else {
      print("Some error occured");

    }
  }

}

