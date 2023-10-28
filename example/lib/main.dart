import 'dart:io';

import 'package:chatwoot_sdk/chatwoot_sdk.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatwoot Example"),
      ),
      body: ChatwootWidget(
        websiteToken: "KweSiQksBzxtKQkjdqn9t33h",
        baseUrl: "https://chat.playgpl.com:3000",
        user: ChatwootUser(
          identifier: "local@gpl",
          name: "local 12345",
          email: "local@gpl",
        ),
        onAttachFile: _pickFiles,
      ),
    );
  }

  Future<List<String>> _pickFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      File file = File(result.files.single.path!);
      return [file.uri.toString()];
    } else {
      return [];
    }
  }
}
