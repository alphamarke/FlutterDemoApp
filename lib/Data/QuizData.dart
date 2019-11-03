import 'package:first_flutter_app/Model/Quiz.dart';

class QuizData {
  int _questionNumber = 0;

  List<Quiz> _quizData = [
    Quiz(
        question: 'Some cats are actually allergic to humans',
        questionAnswer: true),
    Quiz(
        question: 'You can lead a cow down stairs but not up stairs.',
        questionAnswer: false),
    Quiz(
        question: 'Approximately one quarter of human bones are in the feet.',
        questionAnswer: true),
    Quiz(question: 'A slug\'s blood is green.', questionAnswer: true),
    Quiz(
        question: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        questionAnswer: true),
    Quiz(
        question: 'It is illegal to pee in the Ocean in Portugal.',
        questionAnswer: true),
    Quiz(
        question:
            'No piece of square dry paper can be folded in half more than 7 times.',
        questionAnswer: false),
    Quiz(
        question:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        questionAnswer: true),
    Quiz(
        question:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        questionAnswer: false),
    Quiz(
        question:
            'The total surface area of two human lungs is approximately 70 square metres.',
        questionAnswer: true),
    Quiz(
        question: 'Google was originally called \"Backrub\".',
        questionAnswer: true),
    Quiz(
        question:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        questionAnswer: true),
    Quiz(
        question:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        questionAnswer: true),
  ];

  void restQuiz() {
    _questionNumber = 0;
  }

  void nextQuestion() {
    if (_quizData.length > _questionNumber) {
      _questionNumber++;
    }
  }

  bool quizFinished() {
    return _quizData.length - 1 == _questionNumber;
  }

  String getQuizQuestion() {
    return _quizData[_questionNumber].question;
  }

  bool checkQuizAnswer(bool answer) {
    return _quizData[_questionNumber].questionAnswer == answer ? true : false;
  }
}
