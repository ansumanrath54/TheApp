import 'package:flutter/material.dart';
import 'package:social_media_app_starter/chat_app/modules/chat_detail_page.dart';

class ChatMessage{
  String message;
  MessageType type;
  ChatMessage({@required this.message,@required this.type});
}