import 'package:firebase/data/firestorage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'storage_event.dart';
part 'storage_state.dart';

class StorageBloc extends Bloc<StorageEvent, StorageState> {
  FireStorage storage = FireStorage();

  StorageBloc() : super(StorageInitial()) {
    on<ImageLoadedEvent>((event, emit) async {
      String url = '';
      try {
        url = await storage.getImage(event.title);
      } catch (e) {
        emit(ImageErrorState(e.toString()));
      }

      emit(ImageLoadedState(url));
    });
  }
}
