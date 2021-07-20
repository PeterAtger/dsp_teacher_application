class Answers {
  final List<_Answer> answers;

  Answers(this.answers);
}

class _Answer {
  final List<String> answerWord;
  final String askedTime;
  final List<double> accuracy;

  _Answer(this.answerWord, this.askedTime, this.accuracy);
}
