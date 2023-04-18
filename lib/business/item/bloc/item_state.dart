part of 'item_bloc.dart';

@immutable
abstract class ItemState {}

class ItemInitialState extends ItemState {}

class ItemLoadedState extends ItemState {
  final List<Item> items;

  ItemLoadedState(this.items);
}

class ItemErrorState extends ItemState {
  final String error;

  ItemErrorState(this.error);
}
