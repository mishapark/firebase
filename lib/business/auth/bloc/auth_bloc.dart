import 'package:firebase/data/fireauth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  FireAuth auth = FireAuth();

  AuthBloc() : super(AuthInitial()) {
    on<GetUsers>((event, emit) {
      final userStream = auth.users();
      emit(UserStreamOn(userStream));
    });

    on<GoogleSignInRequested>((event, emit) {
      try {
        if (kIsWeb) {
          auth.signInWithGoogleWeb();
        } else {
          auth.signInWithGoogle();
        }
      } catch (e) {
        emit(UnAuthenticated());
      }
    });

    on<Logout>((event, emit) {
      try {
        auth.signOut();
      } catch (e) {
        emit(UnAuthenticated());
      }
    });
  }
}
