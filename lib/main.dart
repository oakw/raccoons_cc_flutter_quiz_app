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
            // Pirmā rinda ar atbilžu variantiem
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Option(text: "Bruņurupucis", isCorrect: false),
                  Option(text: "Jaguārs", isCorrect: true),
                ],
              ),
            ),
            // Otrā rinda ar atbilžu variantiem
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Option(text: "Lauva", isCorrect: false),
                  Option(text: "Strauss", isCorrect: false),
                ],
              ),
            ),
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
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        fixedSize: const Size.fromWidth(140),
      ),
      onPressed: () {
        if (isCorrect) {
          showDialog(
              context: context,
              builder: (BuildContext builder) {
                return const AlertDialog(content: Text("Atbilde ir pareiza"));
              });
        } else {
          showDialog(
              context: context,
              builder: (BuildContext builder) {
                return const AlertDialog(content: Text("Atbilde nav pareiza"));
              });
        }
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
