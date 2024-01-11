class CounterModel {
  final int counter;
  final String text;

  CounterModel({required this.counter, required this.text});

  factory CounterModel.fromJson(Map<String, dynamic> json) {
    return CounterModel(counter: json['counter'], text: json['text']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['counter'] = counter;
    data['text'] = text;

    return data;
  }
}
