import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_example/samples/quill_text_sample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('home'),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(text: 'quillTextSample1'),
                Tab(text: 'quillTextSample2'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: MyQuillEditor(
                  document: Document.fromJson(quillTextSample),
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: MyQuillEditor(
                  document: Document.fromJson(quillTextSample),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyQuillEditor extends StatelessWidget {
  const MyQuillEditor({
    required this.document,
    super.key,
  });

  final Document document;

  @override
  Widget build(BuildContext context) {
    final controller = QuillController(
      document: document,
      selection: const TextSelection.collapsed(offset: 0),
      readOnly: true,
    );

    return QuillEditor(
      scrollController: ScrollController(),
      focusNode: FocusNode(),
      controller: controller,
      configurations: const QuillEditorConfigurations(
        scrollable: false,
        showCursor: false,
      ),
    );
  }
}
