



import 'package:flutter/material.dart';
import 'package:medi_reminder/home_page.dart';
import 'Sign In Page.dart';
import 'SignUpPage.dart';
import 'ForgetPassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyD3LnhByLSItmIaoHzotbCOmt6BwJ5vIjg",
        appId: "1:110067684030:android:0fcf6f7b49eb6cd1ddc4ef",
        messagingSenderId: "110067684030",
        projectId: "med-reminder-499a4"),
  )
      : await Firebase.initializeApp();
  runApp(
      MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication App',
      home:SignUpPage(controller: null),
        /*routes: {
        '/next': (context) => homepage(),
        },*/
      ),
    );
  }

