import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBGVZqUiIMkYXHeaNrNaDkAS08F1wefJtQ",
            authDomain: "duet-ai-roadshow-415022.firebaseapp.com",
            projectId: "duet-ai-roadshow-415022",
            storageBucket: "duet-ai-roadshow-415022.appspot.com",
            messagingSenderId: "172711540191",
            appId: "1:172711540191:web:2535565a27bf5cd23dc06a",
            measurementId: "G-PZ260JW797"));
  } else {
    await Firebase.initializeApp();
  }
}
