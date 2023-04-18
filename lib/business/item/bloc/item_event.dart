part of 'item_bloc.dart';

@immutable
abstract class ItemEvent {}

class LoadItems extends ItemEvent {}

class AddItem extends ItemEvent {
  final Item item;

  AddItem(this.item);
}

class FlagItem extends ItemEvent {
  final Item item;

  FlagItem(this.item);
}
