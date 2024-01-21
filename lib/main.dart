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
            Question(
              text: "Kurš ir ātrākais sauszemes dzīvnieks?",
              options: [
                Option(text: "Bruņurupucis", isCorrect: false),
                Option(text: "Jaguārs", isCorrect: true),
                Option(text: "Lauva", isCorrect: false),
                Option(text: "Strauss", isCorrect: false),
              ],
            ),
            Question(
              text: "Kā sauc sīku ūdens pilienu uzkrāšanos atmosfēras zemākajos slāņos?",
              options: [
                Option(text: "Iztvaikošana", isCorrect: false),
                Option(text: "Varavīksne", isCorrect: false),
                Option(text: "Rasa", isCorrect: false),
                Option(text: "Migla", isCorrect: true),
              ],
            ),
            Question(
              text: "Kurš ieguva FIFA 2023. gada labākā futbolista balvu?",
              options: [
                Option(text: "Krištianu Ronaldu", isCorrect: false),
                Option(text: "Lionels Mesi", isCorrect: true),
                Option(text: "Roberts Levandovskis", isCorrect: false),
                Option(text: "Karīms Benzemā", isCorrect: false),
              ],
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
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

// Jautājums ar tā tekstu un atbilžu variantiem
class Question extends StatelessWidget {
  final String text;
  final List<Option> options;
  const Question({
    super.key,
    required this.text,
    required this.options,
  });

  // Sagatavo jautājuma atbilžu rindas
  List<Widget> getOptionRows() {
    List<Widget> rows = List.empty(growable: true);
    List<Option> rowOptions = List.empty(growable: true);

    for (var i = 0; i < options.length; i++) {
      rowOptions.add(options[i]);

      // Vienā rindā ir divi elementi vai viens, ja vairāk atbilžu iespēju nav
      if (rowOptions.length == 2 || i + 1 == options.length) {
        rows.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: rowOptions.toList(),
            ),
          ),
        );

        rowOptions.clear();
      }
    }

    return rows;
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
          ...getOptionRows()
        ],
      ),
    );
  }
}
