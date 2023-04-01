





import 'package:chatgpt/chat_screen.dart';
import 'package:chatgpt/constants/constant.dart';
import 'package:chatgpt/home.dart';
import 'package:chatgpt/providers/model_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChatGpt());


}

class ChatGpt extends StatefulWidget {
  const ChatGpt({ Key? key }) : super(key: key);

  @override
  _ChatGptState createState() => _ChatGptState();
}

class _ChatGptState extends State<ChatGpt> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ModelProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: scaffoleBackground,
          appBarTheme: AppBarTheme(
            color: cardColor
          )
        ),
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}