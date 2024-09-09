class Message {
  String message;
  String id;
  String date;

  Message({required this.message, required this.id, required this.date});
  factory Message.fromJson(json) {
    return Message(
        message: json['message'], id: json['id'], date: json['date'].toString());
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'id': id, 'date': date};
  }
}
