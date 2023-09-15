import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  final int questionNumber;
  String? selectedOption;
  bool greenButtonSelected = false;
  bool redButtonSelected = false;
  List<String> dropdownOptions;

  QuestionWidget(this.questionNumber, this.dropdownOptions);

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  Color textBackgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: textBackgroundColor,
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Soru ${widget.questionNumber}',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 200.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: widget.selectedOption,
                items: widget.dropdownOptions.map((option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        option.length > 25
                            ? option.substring(0, 25) + "..."
                            : option,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    widget.selectedOption = value;
                  });
                },
                isExpanded: true,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                textBackgroundColor = Colors.green;
                widget.greenButtonSelected = true;
                widget.redButtonSelected = false;
              });
            },
            icon: Icon(Icons.check, color: Colors.green),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                textBackgroundColor = Colors.red;
                widget.greenButtonSelected = false;
                widget.redButtonSelected = true;
              });
            },
            icon: Icon(Icons.close, color: Colors.red),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                textBackgroundColor = Colors.white;
                widget.greenButtonSelected = false;
                widget.redButtonSelected = false;
              });
            },
            icon: Icon(Icons.restore, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
