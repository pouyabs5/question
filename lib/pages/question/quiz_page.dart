import 'package:flutter/material.dart';
import 'package:question/constants.dart';
import 'package:question/models/quiz_model.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Widget> _questionFormatWidget = [];
  final List<TextModel> _correctOptions = [];
  final List<TextModel> _filledAnswers = [];
  bool _enableCleaningButtons = false;
  bool _enableNextButtons = false;
  int _totalLifes = 4;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _initQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFBFAFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.close,
              color: Color(0xff6E7191),
            ),
          )
        ],
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Color(0xffEA174A),
                size: 24,
              ),
              onPressed: () {},
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              _totalLifes.toString(),
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xffEA174A),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const LinearProgressIndicator(
                  value: 0,
                ),
                const SizedBox(
                  height: 32,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'ماهي اللغة التي سوف نستخدمها لبرمجة أساس المشروع؟',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff040412),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  color: const Color(0xffEFF0F6),
                  child: const Text(
                    'index.html',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xffD9DBE9),
                  thickness: 1,
                  height: 1,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  color: const Color(0xffEFF0F6),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 4,
                    children: _questionFormatWidget,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  children: [
                    FloatingActionButton.small(
                      onPressed: _enableNextButtons
                          ? () {
                        _onNextClicked();
                      }
                          : null,
                      elevation: 0,
                      backgroundColor:
                      _enableNextButtons ? Colors.deepPurple : Colors.grey,
                      child: const RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.restart_alt_outlined,
                        color: _enableCleaningButtons
                            ? Colors.black
                            : const Color(0xffD9DBE9),
                        size: 24,
                      ),
                      onPressed: _enableCleaningButtons
                          ? () {
                        _onResetClicked();
                      }
                          : null,
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    IconButton(
                      onPressed: _enableCleaningButtons
                          ? () {
                        _onBackspaceClicked();
                      }
                          : null,
                      icon: Icon(
                        Icons.backspace_outlined,
                        color: _enableCleaningButtons
                            ? Colors.black
                            : const Color(0xffD9DBE9),
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    itemBuilder: (context, index) =>
                        GestureDetector(
                          onTap: _correctOptions[index].text.isNotEmpty
                              ? () {
                            _onOptionTapped(index);
                          }
                              : null,
                          child: Container(
                            constraints: const BoxConstraints(minWidth: 70),
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Color(0xffD9DBE9),
                            ),
                            child: Center(child: Text(
                                _correctOptions[index].text)),
                          ),
                        ),
                    itemCount: _correctOptions.length,
                    scrollDirection: Axis.horizontal,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _initQuiz() {
    QuizModel quizModel = QuizModel.fromJson(json);
    String rawQuizString =
    quizModel.interactionModule.files.first.content.trim();
    String questionString = '';
    int startIndex = 0;

    quizModel.interactionModule.interactionOptions.sort(
          (a, b) {
        return a.text.start.compareTo(b.text.start);
      },
    );
    for (var option in quizModel.interactionModule.interactionOptions) {
      questionString = rawQuizString.substring(startIndex, option.text.start);
      if (questionString.isNotEmpty) {
        _questionFormatWidget.add(Text(questionString));
      }
      _questionFormatWidget.add(
        Container(
          width: 60,
          height: 30,
          color: Colors.grey,
        ),
      );
      startIndex = option.text.end;
      _correctOptions.add(option.text);
    }
    _correctOptions.sort(
          (a, b) {
        return a.position.compareTo(b.position);
      },
    );
    _questionFormatWidget
        .add(Text(rawQuizString.substring(startIndex, rawQuizString.length)));
    setState(() {});
  }

  _onOptionTapped(int index) {
    for (var element in _questionFormatWidget) {
      if (element is Container) {
        if ((element).child == null) {
          setState(() {
            var currentOption = _correctOptions[index];
            var filledAnswer = TextModel(
              position: currentOption.position,
              end: currentOption.end,
              length: currentOption.length,
              start: currentOption.start,
              text: currentOption.text,
            );
            _filledAnswers.add(filledAnswer);
            _questionFormatWidget[_questionFormatWidget.indexOf(element)] =
                Container(
                  color: Colors.grey,
                  padding: const EdgeInsets.all(8),
                  child: Text(_correctOptions[index].text),
                );
            _correctOptions[index].text = '';
            _enableCleaningButtons = true;
          });
          if (_filledAnswers.length == _correctOptions.length) {
            _enableNextButtons = true;
          }
          return;
        }
      }
    }
  }

  void _onResetClicked() {
    _correctOptions.clear();
    _questionFormatWidget.clear();
    _filledAnswers.clear();
    _enableCleaningButtons = false;
    _enableNextButtons = false;
    _initQuiz();
  }

  void _onBackspaceClicked() {
    List<Container> filledContainers = [];
    for (var element in _questionFormatWidget) {
      if (element is Container) {
        if (element.child != null) {
          filledContainers.add(element);
        }
      }
    }
    if (filledContainers.isNotEmpty) {
      setState(() {
        _enableNextButtons = false;
        _questionFormatWidget[
        _questionFormatWidget.indexOf(filledContainers.last)] = Container(
          width: 60,
          height: 30,
          color: Colors.grey,
        );
        _correctOptions[_filledAnswers.last.position - 1] = _filledAnswers.last;
        _filledAnswers.removeLast();
      });
      if (_filledAnswers.isEmpty) {
        setState(() {
          _enableCleaningButtons = false;
        });
      }
    }
  }

  void _onNextClicked() {
    bool allAnswersAreCorrect = true;
    for (int i = 0; i < _filledAnswers.length; i++) {
      if (_filledAnswers[i].position - 1 != i) {
        allAnswersAreCorrect = false;
      }
    }
    if (_totalLifes >= 1 && !allAnswersAreCorrect) {
      setState(() {
        _totalLifes -= 1;
      });
    }
    if(_totalLifes == 0) {
      showScaffold('You need more life items', Colors.redAccent);
    } else if(!allAnswersAreCorrect) {
      showScaffold('sorry You have mistakes!', Colors.redAccent);
    } else {
      showScaffold('Congrats! all answers are correct', Colors.lightGreen);
    }
  }
  void showScaffold(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
