import 'package:firebase/business/auth/bloc/auth_bloc.dart';
import 'package:firebase/business/item/bloc/item_bloc.dart';
import 'package:firebase/business/storage/bloc/storage_bloc.dart';
import 'package:firebase/firebase_options.dart';
import 'package:firebase/ui/my_home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ItemBloc()..add(LoadItems()),
          ),
          BlocProvider(
            create: (context) =>
                StorageBloc()..add(ImageLoadedEvent('image.webp')),
          ),
          BlocProvider(
            create: (context) => AuthBloc()..add(GetUsers()),
          ),
        ],
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is UserStreamOn) {
              return StreamBuilder(
                stream: state.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const MyHomePage(title: 'Shopping List');
                  } else {
                    return ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(GoogleSignInRequested());
                        },
                        child: const Text('Sign In'));
                  }
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
