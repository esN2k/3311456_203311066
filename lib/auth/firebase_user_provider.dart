import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class EsenChatFirebaseUser {
  EsenChatFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

EsenChatFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<EsenChatFirebaseUser> esenChatFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<EsenChatFirebaseUser>(
      (user) {
        currentUser = EsenChatFirebaseUser(user);
        return currentUser!;
      },
    );
