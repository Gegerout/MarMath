import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_app/states.dart';
import 'package:image/image.dart' as img;

class CalculatorScreen extends ConsumerStatefulWidget {
  const CalculatorScreen({super.key});

  @override
  ConsumerState<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends ConsumerState<CalculatorScreen> {
  TextEditingController requestCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Калькулятор"), actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: requestCont,
            ),
            ref.watch(sendListsProvider).wolframImage == null ? Container() : Image.memory(Uint8List.fromList(
                img.encodeGif(ref
                    .watch(sendListsProvider)
                    .wolframImage!))),
            // Image.network(
            //         "http://api.wolframalpha.com/v1/simple?appid=K6G3JW-7UPEA57PVT&i=y=cos(x)&layout=divider&fontsize=26"),
            ElevatedButton(
                onPressed: () {
                  ref
                      .read(sendListsProvider.notifier)
                      .sendWolfram("cos(x)^2 + sin(x)^2 = ?");
                },
                child: Icon(Icons.play_arrow)),
          ],
        ),
      ),
    );
  }
}
