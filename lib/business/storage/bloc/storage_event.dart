part of 'storage_bloc.dart';

@immutable
abstract class StorageEvent {}

class ImageLoadedEvent extends StorageEvent {
  final String title;

  ImageLoadedEvent(this.title);
}
