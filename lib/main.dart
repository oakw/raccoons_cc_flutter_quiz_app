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
                Text("Bruņurupucis"),
                Text("Jaguārs"),
              ],
            ),
            Row(
              children: [
                Text("Lauva"),
                Text("Strauss"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
