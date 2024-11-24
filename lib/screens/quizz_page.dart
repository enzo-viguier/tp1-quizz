import 'package:flutter/material.dart';

import '../model/question.dart';

class QuizzPage extends StatefulWidget {

  const QuizzPage({super.key, required this.title});

  final String title;

  @override
  State<QuizzPage> createState() => _SomeQuizzPageState();
}

class _SomeQuizzPageState extends State<QuizzPage> {
  final List<Question> _questions = [
    Question(
      questionText: "Le soleil est une étoile géante rouge.",
      isCorrect: false,
      imagePath: "assets/images/sun.jpg",
    ),
    Question(
      questionText: "Mercure est la planète la plus proche du Soleil.",
      isCorrect: true,
      imagePath: "assets/images/mercure.jpg",
    ),
    Question(
      questionText: "Vénus est surnommée la planète rouge.",
      isCorrect: false,
      imagePath: "assets/images/venus.jpg",
    ),
    Question(
      questionText: "La Terre est une planète gazeuse ?",
      isCorrect: false,
      imagePath: "assets/images/earth.jpg",
    ),
    Question(
        questionText: "Mars possède un système d'anneaux similaire à celui de Saturne.",
        isCorrect: false,
        imagePath: "assets/images/mars.jpg"
    ),
    Question(
      questionText: "Jupiter est la plus grande planète du système solaire.",
      isCorrect: true,
      imagePath: "assets/images/jupiter.jpg",
    ),
    Question(
      questionText: "Les anneaux de Saturne sont composés principalement de glace et de roches.",
      isCorrect: true,
      imagePath: "assets/images/saturne.jpg",
    ),
    Question(
      questionText: "Uranus a une inclinaison axiale qui la fait tourner presque sur le côté.",
      isCorrect: true,
      imagePath: "assets/images/uranus.jpg",
    ),
    Question(
      questionText: "Neptune est connue pour ses températures élevées et sa proximité avec le Soleil.",
      isCorrect: false,
      imagePath: "assets/images/neptune.jpg",
    ),
    Question(
      questionText: "Le système solaire compte huit planètes principales.",
      isCorrect: true,
      imagePath: "assets/images/system.jpg",
    ),
  ];

  int _currentQuestionIndex = 0; // Index de la question actuelle
  String _feedback = ''; // Message de retour après une réponse
  int _correctAnswersCount = 0; // Compteur des bonnes réponses
  bool _isQuizFinished = false; // Indicateur de fin de quiz

  void _checkAnswer(bool userChoice) {
    setState(() {
      if (userChoice == _questions[_currentQuestionIndex].isCorrect) {
        if (!_isQuizFinished) _correctAnswersCount++; // Incrémenter si la réponse est correcte
        _feedback = "Bonne réponse !";
      } else {
        _feedback = "Mauvaise réponse.";
      }

      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _feedback = "Quiz terminé.";
        _isQuizFinished = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image dynamique liée à la question actuelle
            Image(
              image: AssetImage(_questions[_currentQuestionIndex].imagePath),
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 20),
            // Question actuelle
            Text(
              _questions[_currentQuestionIndex].questionText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Compteur de bonnes réponses
            Text(
              'Bonnes réponses : $_correctAnswersCount/${_questions.length}',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 20),
            // Boutons pour répondre
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _checkAnswer(true),
                  child: const Text("Vrai"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _checkAnswer(false),
                  child: const Text("Faux"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Message de retour après une réponse
            Text(
              _feedback,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
