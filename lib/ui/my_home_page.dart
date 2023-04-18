import 'dart:math';

import 'package:firebase/business/auth/bloc/auth_bloc.dart';
import 'package:firebase/business/item/bloc/item_bloc.dart';
import 'package:firebase/business/storage/bloc/storage_bloc.dart';
import 'package:firebase/data/model/item.dart';
import 'package:firebase/ui/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  void onTap(item) {
    context.read<ItemBloc>().add(FlagItem(item));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(Logout());
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: Stack(
          children: [
            BlocBuilder<StorageBloc, StorageState>(
              builder: (context, state) {
                if (state is ImageLoadedState) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(state.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    color: Colors.cyan[300],
                  );
                }
              },
            ),
            Column(
              children: [
                Expanded(
                  child: BlocBuilder<ItemBloc, ItemState>(
                    builder: (context, state) {
                      if (state is ItemLoadedState) {
                        return ListView(
                          children: state.items
                              .map((e) => ItemCard(
                                  title: e.title,
                                  isPurchased: e.isPurchased,
                                  onTap: () => onTap(e)))
                              .toList(),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            hintText: 'Add new item',
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          flex: 1,
                          child: OutlinedButton(
                              onPressed: () {
                                context.read<ItemBloc>().add(
                                      AddItem(
                                        Item(
                                          title: controller.text,
                                          isPurchased: false,
                                          id: Random().nextInt(100).toString(),
                                        ),
                                      ),
                                    );
                              },
                              child: const Text('Add')))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
