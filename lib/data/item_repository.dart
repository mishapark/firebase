import 'package:firebase/data/model/item.dart';

abstract class ItemsRepository {
  Stream<List<Item>> items();

  Future<void> addNewItem(Item item);

  Future<void> flagItem(Item item);
}
