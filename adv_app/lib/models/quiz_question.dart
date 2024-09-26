class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswer() {
    final shuffedList = List.of(answers); // create copy of answer and shuffle
    shuffedList.shuffle();
    return shuffedList;
  }
}
