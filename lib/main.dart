import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_app/ads_screen.dart';
import 'package:math_app/calculator_screen.dart';
import 'package:math_app/compile_code_screen.dart';
import 'package:math_app/find_normal_screen.dart';
import 'package:math_app/gauss_method_screen.dart';
import 'package:math_app/gauss_screen.dart';
import 'package:math_app/home_screen.dart';
import 'package:math_app/states.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //MobileAds.instance.initialize();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: HomeScreen(),
        // Column(
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         Container(
        //           width: 60,
        //           height: 60,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: TextFormField(
        //             controller: cont1,
        //             keyboardType: TextInputType.number,
        //             textInputAction: TextInputAction.next,
        //             decoration: const InputDecoration(
        //               hintText: "",
        //               border: OutlineInputBorder(),
        //             ),
        //           ),
        //         ),
        //         Container(
        //           width: 60,
        //           height: 60,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: TextFormField(
        //             controller: cont2,
        //             keyboardType: TextInputType.number,
        //             textInputAction: TextInputAction.next,
        //             decoration: const InputDecoration(
        //               hintText: "",
        //               border: OutlineInputBorder(),
        //             ),
        //           ),
        //         ),
        //         Container(
        //           width: 60,
        //           height: 60,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: TextFormField(
        //             controller: cont3,
        //             keyboardType: TextInputType.number,
        //             textInputAction: TextInputAction.next,
        //             decoration: const InputDecoration(
        //               hintText: "",
        //               border: OutlineInputBorder(),
        //             ),
        //           ),
        //         ),
        //         Container(
        //           width: 60,
        //           height: 60,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: TextFormField(
        //             controller: cont4,
        //             keyboardType: TextInputType.number,
        //             textInputAction: TextInputAction.next,
        //             decoration: const InputDecoration(
        //               hintText: "",
        //               border: OutlineInputBorder(),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //     const SizedBox(height: 20),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         Container(
        //           width: 60,
        //           height: 60,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: TextFormField(
        //             controller: cont5,
        //             keyboardType: TextInputType.number,
        //             textInputAction: TextInputAction.next,
        //             decoration: const InputDecoration(
        //               hintText: "",
        //               border: OutlineInputBorder(),
        //             ),
        //           ),
        //         ),
        //         Container(
        //           width: 60,
        //           height: 60,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: TextFormField(
        //             controller: cont6,
        //             keyboardType: TextInputType.number,
        //             textInputAction: TextInputAction.next,
        //             decoration: const InputDecoration(
        //               hintText: "",
        //               border: OutlineInputBorder(),
        //             ),
        //           ),
        //         ),
        //         Container(
        //           width: 60,
        //           height: 60,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: TextFormField(
        //             controller: cont7,
        //             keyboardType: TextInputType.number,
        //             textInputAction: TextInputAction.next,
        //             decoration: const InputDecoration(
        //               hintText: "",
        //               border: OutlineInputBorder(),
        //             ),
        //           ),
        //         ),
        //         Container(
        //           width: 60,
        //           height: 60,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: TextFormField(
        //             controller: cont8,
        //             keyboardType: TextInputType.number,
        //             textInputAction: TextInputAction.next,
        //             decoration: const InputDecoration(
        //               hintText: "",
        //               border: OutlineInputBorder(),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //     const SizedBox(height: 20),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         Container(
        //           width: 60,
        //           height: 60,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: TextFormField(
        //             controller: cont9,
        //             keyboardType: TextInputType.number,
        //             textInputAction: TextInputAction.next,
        //             decoration: const InputDecoration(
        //               hintText: "",
        //               border: OutlineInputBorder(),
        //             ),
        //           ),
        //         ),
        //         Container(
        //           width: 60,
        //           height: 60,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: TextFormField(
        //             controller: cont10,
        //             keyboardType: TextInputType.number,
        //             textInputAction: TextInputAction.next,
        //             decoration: const InputDecoration(
        //               hintText: "",
        //               border: OutlineInputBorder(),
        //             ),
        //           ),
        //         ),
        //         Container(
        //           width: 60,
        //           height: 60,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: TextFormField(
        //             controller: cont11,
        //             keyboardType: TextInputType.number,
        //             textInputAction: TextInputAction.next,
        //             decoration: const InputDecoration(
        //               hintText: "",
        //               border: OutlineInputBorder(),
        //             ),
        //           ),
        //         ),
        //         Container(
        //           width: 60,
        //           height: 60,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: TextFormField(
        //             controller: cont12,
        //             keyboardType: TextInputType.number,
        //             textInputAction: TextInputAction.next,
        //             decoration: const InputDecoration(
        //               hintText: "",
        //               border: OutlineInputBorder(),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //       ref
        //           .watch(sendListsProvider((
        //       [
        //         [cont1.text, cont2.text, cont3.text],
        //         [cont5.text, cont6.text, cont7.text],
        //         [cont9.text, cont10.text, cont11.text]
        //       ],
        //       [cont4.text, cont8.text, cont12.text]
        //       )))
        //           .when(
        //           data: (value) {
        //             return Text(value[0]);
        //           },
        //           error: (error, stacktrace) {
        //             return AlertDialog(
        //               title: Text(error.toString()),
        //               actions: [
        //                 ElevatedButton(
        //                     onPressed: () {
        //                       Navigator.pop(context);
        //                     },
        //                     child: const Text("Ok"))
        //               ],
        //             );
        //           },
        //           loading: () =>
        //           const Center(
        //             child: CircularProgressIndicator(),
        //           ))
        //   ],
        // ),
      ),
    );
  }
}
