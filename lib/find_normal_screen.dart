import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_app/states.dart';
import 'package:image/image.dart' as img;

class FindNormalScreen extends ConsumerStatefulWidget {
  const FindNormalScreen({super.key});

  @override
  ConsumerState<FindNormalScreen> createState() => _FindNormalScreenState();
}

class _FindNormalScreenState extends ConsumerState<FindNormalScreen> {
  TextEditingController vector1Cont = TextEditingController();
  TextEditingController vector2Cont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Нормаль к плоскости"), actions: [
        IconButton(onPressed: () {
          vector1Cont.clear();
          vector2Cont.clear();
          ref.read(sendListsProvider.notifier).clearNormalStates();
        }, icon: const Icon(Icons.refresh)),
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.circular(16)),
                child: TextFormField(
                  controller: vector1Cont,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    List<String> list1 = vector1Cont.text.split(" ");
                    List<String> list2 = vector2Cont.text.split(" ");

                    if (list1.length >= 3 &&
                        list2.length >= 3) {
                      ref
                          .read(sendListsProvider.notifier)
                          .findNormal(list1, list2);
                    }
                  },
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: "Вектор 1",
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
              // Row(
              //   children: [
              //     // Pinput(
              //     //   length: 3,
              //     //   controller: vector1Cont,
              //     //   onChanged: (value) {
              //     //     if (vector1Cont.text.length == 3 &&
              //     //         vector2Cont.text.length == 3) {
              //     //       ref.read(sendListsProvider.notifier).findNormal([
              //     //         vector1Cont.text[0],
              //     //         vector1Cont.text[1],
              //     //         vector1Cont.text[2]
              //     //       ], [
              //     //         vector2Cont.text[0],
              //     //         vector2Cont.text[1],
              //     //         vector2Cont.text[2]
              //     //       ]);
              //     //     }
              //     //   },
              //     //   defaultPinTheme: PinTheme(
              //     //     width: 60,
              //     //     height: 60,
              //     //     textStyle: const TextStyle(
              //     //         fontSize: 24, fontWeight: FontWeight.w500),
              //     //     decoration: BoxDecoration(
              //     //         borderRadius: BorderRadius.circular(15),
              //     //         border: Border.all(color: Colors.grey, width: 2)),
              //     //   ),
              //     //   submittedPinTheme: PinTheme(
              //     //     width: 60,
              //     //     height: 60,
              //     //     textStyle: const TextStyle(
              //     //         fontSize: 24, fontWeight: FontWeight.w500),
              //     //     decoration: BoxDecoration(
              //     //         borderRadius: BorderRadius.circular(15),
              //     //         border:
              //     //             Border.all(color: Colors.blueAccent, width: 2)),
              //     //   ),
              //     // ),
              //     const Text(
              //       " - Вектор 1",
              //       style: TextStyle(
              //           fontSize: 20,
              //           fontWeight: FontWeight.w500,
              //           overflow: TextOverflow.ellipsis),
              //     )
              //   ],
              // ),
              const SizedBox(height: 20),
              Container(
                width: 200,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.circular(16)),
                child: TextFormField(
                  controller: vector2Cont,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    List<String> list1 = vector1Cont.text.split(" ");
                    List<String> list2 = vector2Cont.text.split(" ");

                    if (list1.length >= 3 &&
                        list2.length >= 3) {
                      ref
                          .read(sendListsProvider.notifier)
                          .findNormal(list1, list2);
                    }
                  },
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: "Вектор 2",
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
              // Row(
              //   children: [
              //
              //     // Pinput(
              //     //   length: 3,
              //     //   controller: vector2Cont,
              //     //   onChanged: (value) {
              //     //     if (vector1Cont.text.length == 3 &&
              //     //         vector2Cont.text.length == 3) {
              //     //       ref.read(sendListsProvider.notifier).findNormal([
              //     //         vector1Cont.text[0],
              //     //         vector1Cont.text[1],
              //     //         vector1Cont.text[2]
              //     //       ], [
              //     //         vector2Cont.text[0],
              //     //         vector2Cont.text[1],
              //     //         vector2Cont.text[2]
              //     //       ]);
              //     //     }
              //     //   },
              //     //   defaultPinTheme: PinTheme(
              //     //     width: 60,
              //     //     height: 60,
              //     //     textStyle: const TextStyle(
              //     //         fontSize: 24, fontWeight: FontWeight.w500),
              //     //     decoration: BoxDecoration(
              //     //         borderRadius: BorderRadius.circular(15),
              //     //         border: Border.all(color: Colors.grey, width: 2)),
              //     //   ),
              //     //   submittedPinTheme: PinTheme(
              //     //     width: 60,
              //     //     height: 60,
              //     //     textStyle: const TextStyle(
              //     //         fontSize: 24, fontWeight: FontWeight.w500),
              //     //     decoration: BoxDecoration(
              //     //         borderRadius: BorderRadius.circular(15),
              //     //         border:
              //     //             Border.all(color: Colors.blueAccent, width: 2)),
              //     //   ),
              //     // ),
              //     const Text(
              //       " - Вектор 2",
              //       style: TextStyle(
              //           fontSize: 20,
              //           fontWeight: FontWeight.w500,
              //           overflow: TextOverflow.ellipsis),
              //     )
              //   ],
              // ),
              const SizedBox(height: 30),
              ref.watch(sendListsProvider).normalResult.isEmpty
                  ? Container()
                  : const Text(
                      "Координаты нормали",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ref.watch(sendListsProvider).normalResult.length,
                    itemBuilder: (context, index) => Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ref
                                  .watch(sendListsProvider)
                                  .normalResult[index]
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                          ),
                        )),
              ),
              const SizedBox(height: 30),
              ref.watch(sendListsProvider).normalResult.isEmpty
                  ? Container()
                  : const Text(
                      "Визуализация",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
              ref.watch(sendListsProvider).imageCode == null
                  ? Container()
                  : Image.memory(Uint8List.fromList(
                      img.encodePng(ref.watch(sendListsProvider).imageCode!))),
            ],
          ),
        ),
      ),
    );
  }
}
