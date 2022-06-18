class Task {
  String? text;
  bool done;

  Task({this.text, this.done = false});

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        text: json['text'],
        done: json['done'],
      );

  Map<String, dynamic> toJson() => {'text': text, 'done': done};
}
