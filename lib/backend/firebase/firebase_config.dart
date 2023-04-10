import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBQ0PAXwKjURD0mLc7rtI_CgoHXARY4ucs",
            authDomain: "esenchat.firebaseapp.com",
            projectId: "esenchat",
            storageBucket: "esenchat.appspot.com",
            messagingSenderId: "1032163149713",
            appId: "1:1032163149713:web:276c6b3223c0d24bd0fc30",
            measurementId: "G-23X85WWVT8"));
  } else {
    await Firebase.initializeApp();
  }
}
