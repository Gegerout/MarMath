import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_app/states.dart';

class GaussScreen extends ConsumerStatefulWidget {
  const GaussScreen({super.key});

  @override
  _GaussScreenState createState() => _GaussScreenState();
}

class _GaussScreenState extends ConsumerState<GaussScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController row = TextEditingController();
  TextEditingController column = TextEditingController();

  TextEditingController cont1 = TextEditingController();
  TextEditingController cont2 = TextEditingController();
  TextEditingController cont3 = TextEditingController();
  TextEditingController cont4 = TextEditingController();
  TextEditingController cont5 = TextEditingController();
  TextEditingController cont6 = TextEditingController();
  TextEditingController cont7 = TextEditingController();
  TextEditingController cont8 = TextEditingController();
  TextEditingController cont9 = TextEditingController();
  TextEditingController cont10 = TextEditingController();
  TextEditingController cont11 = TextEditingController();
  TextEditingController cont12 = TextEditingController();
  TextEditingController cont13 = TextEditingController();
  TextEditingController cont14 = TextEditingController();
  TextEditingController cont15 = TextEditingController();
  TextEditingController cont16 = TextEditingController();

  TextEditingController ans1 = TextEditingController();
  TextEditingController ans2 = TextEditingController();
  TextEditingController ans3 = TextEditingController();
  TextEditingController ans4 = TextEditingController();

  int rowC = 2;
  int colC = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Размер"),
              SizedBox(
                width: 60,
                child: TextFormField(
                  controller: row,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if(value != null) {
                      if (int.parse(value) > 4) {
                        return '<5!!!';
                      }
                      if(int.parse(value) == 1) {
                        return ">1!!!";
                      }
                      return null;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _formKey.currentState!.validate();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 60,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {
                      rowC = int.parse(row.text);
                      colC = int.parse(row.text);
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Icon(Icons.check)),
              ),
              const SizedBox(height: 20),
              const Text("Уравнения"),
              const SizedBox(height: 20),
              SizedBox(
                height: rowC == 2 ? 150 : rowC == 3 ? 180 : 200,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: colC * rowC,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: rowC,
                        childAspectRatio: colC * rowC / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: rowC == 2 ? 0 : rowC == 3 ? 40 : 50),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: cont1,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else if (index == 1) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: cont2,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else if (index == 2) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: cont3,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else if (index == 3) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: cont4,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else if (index == 4) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: cont5,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else if (index == 5) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: cont6,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else if (index == 6) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: cont7,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else if (index == 7) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: cont8,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else if (index == 8) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: cont9,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else if (index == 9) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: cont10,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else if (index == 10) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: cont11,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else if (index == 11) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: cont12,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else if (index == 12) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: cont13,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else if (index == 13) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: cont14,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else if (index == 14) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: cont15,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else if (index == 15) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: cont16,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
              const SizedBox(height: 20),
              const Text("Ответы"),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: rowC,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: rowC,
                        childAspectRatio: colC * rowC / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 0),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: ans1,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else if (index == 1) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: ans2,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else if (index == 2) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: ans3,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else if (index == 3) {
                        return SizedBox(
                          width: 60,
                          child: TextField(
                            controller: ans4,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
              SizedBox(
                width: 60,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {
                      if (rowC == 2) {
                        ref.read(sendListsProvider.notifier).getAnswers([
                          [cont1.text, cont2.text],
                          [cont3.text, cont4.text]
                        ], [
                          ans1.text,
                          ans2.text
                        ]);
                      } else if (rowC == 3) {
                        ref.read(sendListsProvider.notifier).getAnswers([
                          [cont1.text, cont2.text, cont3.text],
                          [cont4.text, cont5.text, cont6.text],
                          [cont7.text, cont8.text, cont9.text]
                        ], [
                          ans1.text,
                          ans2.text,
                          ans3.text
                        ]);
                      } else if (rowC == 4) {
                        ref.read(sendListsProvider.notifier).getAnswers([
                          [cont1.text, cont2.text, cont3.text, cont4.text],
                          [cont5.text, cont6.text, cont7.text, cont8.text],
                          [cont9.text, cont10.text, cont11.text, cont12.text],
                          [cont13.text, cont14.text, cont15.text, cont16.text]
                        ], [
                          ans1.text,
                          ans2.text,
                          ans3.text,
                          ans4.text
                        ]);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Icon(Icons.check)),
              ),
              const SizedBox(height: 20),
              const Text("Результат вычислений"),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ref.watch(sendListsProvider).result.length,
                    itemBuilder: (context, index) => Center(
                      child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ref.watch(sendListsProvider).result[index],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
