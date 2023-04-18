import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/data/item_repository.dart';
import 'model/item.dart';

class FireStoreRepository implements ItemsRepository {
  late final CollectionReference<Item> _items =
      FirebaseFirestore.instance.collection('items').withConverter<Item>(
            fromFirestore: (snapshots, _) =>
                Item.fromJson(snapshots.id, snapshots.data()!),
            toFirestore: (item, _) => item.toJson(),
          );

  @override
  Stream<List<Item>> items() {
    return _items
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  @override
  Future<void> addNewItem(Item item) {
    return _items.add(item);
  }

  @override
  Future<void> flagItem(Item item) {
    final itemz = _items.doc(item.id);
    return itemz.update(item.copyWith(isPurchased: !item.isPurchased).toJson());
  }
}
