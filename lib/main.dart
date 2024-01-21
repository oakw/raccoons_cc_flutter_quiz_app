import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<MainApp> {
  int _pointCount = 0;

  void _addPoints(int points) {
    setState(() {
      _pointCount += points;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text("Punktu skaits: $_pointCount"),
                      ),
                      Question(
                        text: "Kurš ir ātrākais sauszemes dzīvnieks?",
                        options: [
                          Option(text: "Bruņurupucis", isCorrect: false),
                          Option(text: "Jaguārs", isCorrect: true),
                          Option(text: "Lauva", isCorrect: false),
                          Option(text: "Strauss", isCorrect: false),
                        ],
                        addPoints: _addPoints,
                        image: const Image(
                          image: NetworkImage(
                            "https://i.imgur.com/zUd7HrK_d.webp?maxwidth=760",
                            scale: 3,
                          ),
                        ),
                      ),
                      Question(
                        text: "Kā sauc sīku ūdens pilienu uzkrāšanos atmosfēras zemākajos slāņos?",
                        options: [
                          Option(text: "Iztvaikošana", isCorrect: false),
                          Option(text: "Varavīksne", isCorrect: false),
                          Option(text: "Rasa", isCorrect: false),
                          Option(text: "Migla", isCorrect: true),
                        ],
                        addPoints: _addPoints,
                      ),
                      Question(
                        text: "Kurš ieguva FIFA 2023. gada labākā futbolista balvu?",
                        options: [
                          Option(text: "Krištianu Ronaldu", isCorrect: false),
                          Option(text: "Lionels Mesi", isCorrect: true),
                          Option(text: "Roberts Levandovskis", isCorrect: false),
                          Option(text: "Karīms Benzemā", isCorrect: false),
                        ],
                        addPoints: _addPoints,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Option extends StatefulWidget {
  final String text;
  final bool isCorrect;
  Function(bool)? optionSelected;
  bool isLocked;
  Option({
    super.key,
    required this.text,
    required this.isCorrect,
    this.optionSelected,
    this.isLocked = false,
  });

  @override
  State<StatefulWidget> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  bool answered = false;

  // Lietotājs uzklikšķina uz atbilžu varianta
  void _handleTap() {
    setState(() {
      // Neļauj izvēlēt variantu, ja tas bloķēts (piemēram, jo jautājums jau atbildēts)
      if (!widget.isLocked) {
        answered = true;
        // Paziņo vecāk-komponentei, ka atbilžu variants izvēlēts
        widget.optionSelected?.call(widget.isCorrect);
      }
    });
  }

  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: answered ? (widget.isCorrect ? Colors.greenAccent : Colors.redAccent) : Colors.blueAccent,
        fixedSize: const Size.fromWidth(140),
      ),
      onPressed: _handleTap,
      child: Text(
        widget.text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

// Jautājums ar tā tekstu un atbilžu variantiem
class Question extends StatefulWidget {
  final String text;
  final List<Option> options;
  final Image? image;
  final Function(int) addPoints;
  const Question({
    super.key,
    required this.text,
    required this.options,
    required this.addPoints,
    this.image,
  });

  @override
  State<StatefulWidget> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  bool answered = false;

  void _isOptionSelected(isCorrect) {
    setState(() {
      answered = true;
      if (isCorrect) {
        // Paziņo lietotnes galvenajam state, ka iegūts viens punkts
        widget.addPoints(1);
      }
    });
  }

  // Sagatavo jautājuma atbilžu rindas
  List<Widget> getOptionRows() {
    List<Widget> rows = List.empty(growable: true);
    List<Option> rowOptions = List.empty(growable: true);

    for (var i = 0; i < widget.options.length; i++) {
      Option option = widget.options[i];
      option.optionSelected = _isOptionSelected;
      option.isLocked = answered;
      rowOptions.add(option);

      // Vienā rindā ir divi elementi vai viens, ja vairāk atbilžu iespēju nav
      if (rowOptions.length == 2 || i + 1 == widget.options.length) {
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
              widget.text,
              textAlign: TextAlign.center,
            ),
          ),
          if (widget.image != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: widget.image,
            )
          ],
          ...getOptionRows()
        ],
      ),
    );
  }
}
