import '../class/question_class.dart';

class QuestionsList {
  int _index = 0;

  List<Question> _questions = [
    Question(question: "mavi midir", answer: 1),
    Question(question: "kırmızı mıdır", answer: 1),
    Question(question: "yeşil midir", answer: 1),
    Question(question: "mor mudur", answer: 1),
    Question(question: "mavi midir", answer: 0),
    Question(question: "kırmızı mıdır", answer: 0),
    Question(question: "yeşil midir", answer: 1),
    Question(question: "mor mudur", answer: 1),
  ];

  String getQuestionText() {
    return _questions[_index].question;
  }

  int getQuestionAnswer() {
    return _questions[_index].answer;
  }

  void indexPlus() {
    _index++;
  }

  void resetIndex() {
    _index = 0;
  }

  bool isOver() {
    if (_index + 1 >= _questions.length) {
      _index = 0;
      return true;
    } else {
      return false;
    }
  }
}
