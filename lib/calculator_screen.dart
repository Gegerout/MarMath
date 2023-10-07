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
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Калькулятор"), actions: [
        IconButton(
            onPressed: () {
              requestCont.clear();
              setState(() {
                isFocused = false;
              });
              ref.read(sendListsProvider.notifier).clearWolframStates();
            },
            icon: const Icon(Icons.refresh)),
      ]),
      body: SingleChildScrollView(
        child: TapRegion(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          onTapInside: (event) => setState(() {
            isFocused = true;
          }),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: isFocused ? Colors.blueAccent : Colors.grey,
                          width: 2),
                      borderRadius: BorderRadius.circular(16)),
                  child: TextFormField(
                    textInputAction: TextInputAction.newline,
                    maxLines: null,
                    controller: requestCont,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      hintText: "Введите запрос",
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ref.watch(sendListsProvider).isWolframLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ref.watch(sendListsProvider).wolframImage == null
                    ? Container()
                    : Image.memory(
                            Uint8List.fromList(img.encodeGif(
                                ref.watch(sendListsProvider).wolframImage!)),
                            gaplessPlayback: true,
                          ),
                // Image.network(
                //         "http://api.wolframalpha.com/v1/simple?appid=K6G3JW-7UPEA57PVT&i=y=cos(x)&layout=divider&fontsize=26"),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (requestCont.text.isNotEmpty) {
              ref
                  .read(sendListsProvider.notifier)
                  .sendWolfram(requestCont.text);
            }
          },
          child: const Icon(Icons.play_arrow)),
    );
  }
}
