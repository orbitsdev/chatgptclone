







import 'package:chatgpt/models/char_model.dart';
import 'package:flutter/material.dart';

List<ChatModel> messages= [


    ChatModel(chatIndex: 0, message: 'Hellow What is the hat'),
    ChatModel(chatIndex: 1, message: 'Hi, I am ChatGPT, How can i help you?'),
    ChatModel(chatIndex: 0, message: 'Hellow What is the hat'),
    ChatModel(chatIndex: 1, message: 'Hi, I am ChatGPT, How can i help you?'),



];


List<String> models = [
  'model1',
  'model2',
  'model3',
  'model4',
  'model5',
  'model6',
  'model7',
];



   List<DropdownMenuItem<String>>? get getModelItems {
     List<DropdownMenuItem<String>>? modelItems = List<DropdownMenuItem<String>>.generate(models.length, (index) => DropdownMenuItem(
      value: models[index],
      child: Text(models[index], style: TextStyle(color: Colors.white),)));


      return modelItems;
   }
