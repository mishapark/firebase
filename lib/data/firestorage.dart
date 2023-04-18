import 'package:firebase_storage/firebase_storage.dart';

class FireStorage {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> getImage(String title) {
    return storage.ref(title).getDownloadURL();
  }
}
