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
                Option(text: "Bruņurupucis"),
                Option(text: "Jaguārs"),
              ],
            ),
            Row(
              children: [
                Option(text: "Lauva"),
                Option(text: "Strauss"),
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
  const Option({
    super.key,
    required this.text,
  });

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: () {
        print("Izvēle ir izdarīta!");
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
