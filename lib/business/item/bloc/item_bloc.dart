import 'package:firebase/data/firestore_repository.dart';
import 'package:firebase/data/model/item.dart';
import 'package:firebase/data/item_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemsRepository itemsRepo = FireStoreRepository();

  ItemBloc() : super(ItemInitialState()) {
    on<LoadItems>((event, emit) async {
      try {
        final itemsStream = itemsRepo.items();
        await emit.forEach(
          itemsStream,
          onData: (data) => ItemLoadedState(data),
        );
      } catch (e) {
        emit(ItemErrorState(e.toString()));
      }
    });

    on<AddItem>((event, emit) {
      try {
        itemsRepo.addNewItem(event.item);
      } catch (e) {
        emit(ItemErrorState(e.toString()));
      }
    });

    on<FlagItem>((event, emit) {
      try {
        itemsRepo.flagItem(event.item);
      } catch (e) {
        emit(ItemErrorState(e.toString()));
      }
    });
  }
}
