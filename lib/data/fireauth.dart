import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireAuth {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> users() {
    return auth.userChanges();
  }

  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      return await auth.signInWithCredential(credential);
    }
    return null;
  }

  Future<UserCredential> signInWithGoogleWeb() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    return await auth.signInWithPopup(googleProvider);
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
