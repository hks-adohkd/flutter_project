class Question {
  final int id, answer;
  final String question;
  final List<Options> options;

  Question({this.id, this.question, this.answer, this.options});
}

/*
"script": "خيار 2 ",
                        "questionId": 0,
                        "itemOrder": 2,
                        "isRightOption": false,
                        "id": 5,
                        "created": "2021-06-17T16:17:52",
                        "modified": "2021-06-19T08:37:23.4048135",
                        "isDeleted": false
*/ //

class Options {
  final int id, itemOrder;
  final String question;
  final bool isRightOption;

  Options({this.id, this.question, this.itemOrder, this.isRightOption});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Flutter is an open-source UI software development kit created by ______",
    "options": [
      'AppleFlutter is an open-source UI software development kit created by',
      'Google',
      'Facebook',
      'Microsoft'
    ],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "When google release Flutter.",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "A memory location that holds a single letter or number.",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "What command do you use to output data to the screen?",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
];
