import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';

class EditableTextTab extends StatefulWidget {
  final String defultText;
  const EditableTextTab({
    Key key,
    @required this.defultText,
  }) : super(key: key);

  @override
  _EditableTextTabState createState() => _EditableTextTabState();
}

class _EditableTextTabState extends State<EditableTextTab> {
  TextEditingController _controller;
  final _node = FocusNode();

  @override
  void initState() {
    _controller = TextEditingController(text: widget.defultText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SingleChildScrollView(
        child: EditableText(
          maxLines: null,
          backgroundCursorColor: AppColors.cGreen,
          cursorColor: AppColors.cGreen,
          controller: _controller,
          focusNode: _node,
          style: AppFonts.captionText.copyWith(color: AppColors.cDarkGrey),
        ),
      ),
    );
  }
}
