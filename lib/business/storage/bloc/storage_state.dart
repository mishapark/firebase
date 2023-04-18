part of 'storage_bloc.dart';

@immutable
abstract class StorageState {}

class StorageInitial extends StorageState {}

class ImageLoadedState extends StorageState {
  final String image;

  ImageLoadedState(this.image);
}

class ImageErrorState extends StorageState {
  final String error;

  ImageErrorState(this.error);
}
