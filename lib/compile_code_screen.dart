import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/languages/python.dart';
import 'package:math_app/states.dart';

class CompileCodeScreen extends ConsumerStatefulWidget {
  const CompileCodeScreen({super.key});

  @override
  ConsumerState<CompileCodeScreen> createState() => _CompileCodeScreenState();
}

class _CompileCodeScreenState extends ConsumerState<CompileCodeScreen> {
  CodeController? _codeController;

  String source = "";

  @override
  void initState() {
    super.initState();
    _codeController = CodeController(
      text: source,
      language: python,
      stringMap: monokaiSublimeTheme
    );
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Компилятор Python"), actions: [
        IconButton(
            onPressed: () {
              _codeController!.clear();
              ref.read(sendListsProvider.notifier).clearCodeStates();
            },
            icon: const Icon(Icons.refresh)),
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CodeField(
              controller: _codeController!,
              textStyle: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            ref.watch(sendListsProvider).codeResult == "" ? Container() : const Text("Вывод", style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            Text(ref.watch(sendListsProvider).codeResult, style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.w400))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref.read(sendListsProvider.notifier).compileCode(_codeController!.text);
      }, child: const Icon(Icons.play_arrow)),
    );
  }
}
