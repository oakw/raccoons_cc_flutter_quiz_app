import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, left: 10),
              child: Text("Kurš ir ātrākais sauszemes dzīvnieks?"),
            ),
            Row(
              children: [
                Option(text: "Bruņurupucis", isCorrect: false),
                Option(text: "Jaguārs", isCorrect: true),
              ],
            ),
            Row(
              children: [
                Option(text: "Lauva", isCorrect: false),
                Option(text: "Strauss", isCorrect: false),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Option extends StatelessWidget {
  final String text;
  final bool isCorrect;
  const Option({
    super.key,
    required this.text,
    required this.isCorrect,
  });

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: () {
        if (isCorrect) {
          print("Atbilde ir pareiza");
        } else {
          print("Atbilde nav pareiza");
        }
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
