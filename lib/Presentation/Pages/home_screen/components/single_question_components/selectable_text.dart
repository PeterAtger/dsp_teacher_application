import 'package:dsp_teacher_application/Logic/main/chosen_choic_cubit.dart';
import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordSelectableText extends StatefulWidget {
  final List<String> text;
  final Function(
    String word,
    int index,
    int sentenceLength,
  ) onWordTapped;
  final bool highlight;
  final Color highlightColor;
  final String alphabets;
  final TextStyle style;
  final TextDirection textDirection;
  final int sentenceLength;
  const WordSelectableText(
      {Key key,
      @required this.text,
      this.onWordTapped,
      this.highlight = true,
      this.highlightColor,
      this.alphabets = '[a-zA-Z]',
      this.style,
      this.textDirection = TextDirection.ltr,
      this.sentenceLength = 1})
      : super(key: key);

  @override
  _WordSelectableTextState createState() => _WordSelectableTextState();
}

class _WordSelectableTextState extends State<WordSelectableText> {
  int selectedWordIndex;
  Color highlightColor;
  @override
  void initState() {
    selectedWordIndex = -1;
    if (widget.highlightColor == null)
      highlightColor = Colors.blue.withOpacity(0.3);
    else
      highlightColor = widget.highlightColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> sentenceList =
        splitSentences(widget.text, widget.sentenceLength);
    return Text.rich(
      TextSpan(
        children: [
          for (int i = 0; i < sentenceList.length; i++)
            TextSpan(
              children: [
                TextSpan(
                    text: sentenceList[i],
                    style: TextStyle(
                        color: AppColors.cDarkGrey,
                        backgroundColor:
                            selectedWordIndex == i && widget.highlight
                                ? highlightColor
                                : Colors.transparent),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.read<ChocenChoicCubit>().getOffeset(i);
                        setState(() {
                          selectedWordIndex = i;
                        });
                        if (widget.onWordTapped != null)
                          widget.onWordTapped(
                            sentenceList[i]
                                .trim()
                                .replaceAll(RegExp(r'${widget.alphabets}'), "")
                                .trim(),
                            selectedWordIndex,
                            widget.sentenceLength,
                          );
                      }),
                // TextSpan(text: ' ')
              ],
            )
        ],
      ),
      style: widget.style ?? TextStyle(),
      textDirection: widget.textDirection,
    );
  }
}

List<String> splitSentences(List<String> text, int sentenceLength) {
  int stop = 0;
  String sentence = '';
  List<String> returnedList = [];
  for (var i = 0; i < text.length; i++) {
    if (text[i] != '.') {
      sentence = sentence + text[i] + ' ';
      stop++;
      if (stop == sentenceLength || i + 1 == text.length) {
        returnedList.add(sentence);
        sentence = '';
        stop = 0;
      }
    }
  }
  return returnedList;
}
