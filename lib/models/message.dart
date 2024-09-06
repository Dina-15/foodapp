class Message{
  String message;
  String id;
  Message(this.message, this.id);

  factory Message.fromJson(json)
  {
    return Message(json['message'], json['id']);
  }
}