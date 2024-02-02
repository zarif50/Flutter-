import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String _email = '';
  final Firebaseauthservice _auth = Firebaseauthservice();
  final _emailcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose();
  }
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
                  top: 180, bottom: 20, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Reset\nPassword',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: "Raleway",
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        height: 1.2),
                  ),
                  const SizedBox(height: 15),
                  Column(
                    children: [
                      TextFormField(
                          validator: (input) {
                            if (input == null &&
                                input!.contains('@gmail.com')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onChanged: (value) => _email = value,
                          controller: _emailcontroller,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      const SizedBox(height: 15),
                    ],
                  ),
                  const SizedBox(height: 120),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton.extended(
                          onPressed: passwordreset,
                          label: const Text(
                            'Send Request',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                            ),
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
  //reset password
Future passwordreset()async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailcontroller.text);
    }catch(e){
      print(e);
    }
}
}
