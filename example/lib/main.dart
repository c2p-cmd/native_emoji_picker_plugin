import 'package:flutter/material.dart';

import 'package:native_emoji_picker/native_emoji_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var selectedEmoji = "📝";

  @override
  void initState() {
    super.initState();
  }

  void showPicker() async {
    NativeEmojiPicker.showEmojiPicker(selectedEmoji).then((newEmoji) {
      setState(() {
        selectedEmoji = newEmoji;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Native Emoji Picker Example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Selected Emoji $selectedEmoji',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            Center(
              child: TextButton(
                onPressed: showPicker,
                child: const Text(
                  'Show Picker',
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
