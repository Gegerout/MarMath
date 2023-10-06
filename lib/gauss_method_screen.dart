import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_app/states.dart';

class GaussMethodScreen extends ConsumerStatefulWidget {
  const GaussMethodScreen({super.key});

  @override
  ConsumerState<GaussMethodScreen> createState() => _GaussMethodScreenState();
}

class _GaussMethodScreenState extends ConsumerState<GaussMethodScreen> {
  TextEditingController numbersCont = TextEditingController();
  int tapped = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Способ Гаусса"), actions: [
        IconButton(
            onPressed: () {
              numbersCont.clear();
              ref.read(sendListsProvider.notifier).clearGaussStates();
            },
            icon: const Icon(Icons.refresh)),
      ]),
      body: SingleChildScrollView(
        child: TapRegion(
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                      borderRadius: BorderRadius.circular(16)),
                  child: TextFormField(
                    textInputAction: TextInputAction.newline,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    maxLines: null,
                    controller: numbersCont,
                    onChanged: (value) {
                      List<List<String>> result = [];
                      List<String> answers = [];

                      List<String> lines = numbersCont.text.split('\n');
                      for (String line in lines) {
                        List<String> numbers = line.split(' ');
                        List<String> strList = [];

                        for (int i = 0; i < numbers.length - 1; i++) {
                          strList.add(numbers[i]);
                        }

                        answers.add(numbers.last);
                        result.add(strList);
                      }
                      ref
                          .read(sendListsProvider.notifier)
                          .getAnswers(result, answers);
                    },
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      hintText: "Введите матрицу",
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
                ref.watch(sendListsProvider).result.isEmpty
                    ? Container()
                    : ref.watch(sendListsProvider).result[0] == "Loading"
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            children: [
                              const Text(
                                "Ответы",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 50,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: ref
                                        .watch(sendListsProvider)
                                        .result
                                        .length,
                                    itemBuilder: (context, index) => Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              ref
                                                  .watch(sendListsProvider)
                                                  .result[index],
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        )),
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                "Решение",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w500),
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: ref
                                      .watch(sendListsProvider)
                                      .actions
                                      .length,
                                  itemBuilder: (context, index) {
                                    if (index % 2 != 0) {
                                      return ListView.builder(
                                          itemCount: (ref
                                                  .watch(sendListsProvider)
                                                  .actions[index] as List)
                                              .length,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index2) {
                                            return Center(
                                              child: Text(
                                                ref
                                                    .watch(sendListsProvider)
                                                    .actions[index][index2],
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            );
                                          });
                                    } else {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            ref
                                                .watch(sendListsProvider)
                                                .actions[index]
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      );
                                    }
                                  })
                            ],
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
