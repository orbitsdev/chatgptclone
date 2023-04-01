import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:chatgpt/constants/constant.dart';
import 'package:chatgpt/constants/open_ai.dart';
import 'package:chatgpt/models/char_model.dart';
import 'package:chatgpt/models/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<Model>>? getModel() async {
    try {
      var response = await http.get(Uri.parse("${CHAT_GPT_MODELS_URL}"),
          headers: {'Authorization': 'Bearer ${OPEN_AI_API_KEY}'});

      var jsonResponse = jsonDecode(response.body);


      if(jsonResponse['error'] != null){
        throw HttpException(jsonResponse['error']);
      }

      
      
      return Model.modelFormSnapShot(jsonResponse['data']);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<ChatModel> sendMessage(String message, String model_id) async {
   

  
    
    try {
      var response = await http.post(
        Uri.parse(
          "${CHAT_GPT_MESSAGE_REQUEST_URL}",
        ),
        body: jsonEncode({
           "model": model_id,
          "prompt": message,
          "max_tokens": 500,
        }),
        headers: {
          'Authorization': 'Bearer ${OPEN_AI_API_KEY}',
          "Content-Type": "application/json",
        },
      );


      var jsonResponse = jsonDecode(response.body);
      if(jsonResponse['error'] != null){
        throw HttpException(jsonResponse['error']);
      }

   


    
      ChatModel ai_message = ChatModel(chatIndex: 1, message: jsonResponse['choices'][0]['text'].trim());


    


      return ai_message;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
