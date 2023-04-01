



import 'dart:io';

import 'package:chatgpt/models/char_model.dart';
import 'package:chatgpt/models/model.dart';
import 'package:chatgpt/services/api_services.dart';
import 'package:flutter/material.dart';

class ModelProvider with ChangeNotifier {

    bool isLoading = false;
    List<Model> modelList = [];
    List<ChatModel> chats = [];
    String model_selected = 'text-davinci-003';
    
    List<Model> get getModelList => modelList;
    String get getModelSelected => model_selected ;


    void setModelSelected(String value){
      model_selected = value;
      notifyListeners();
    }

    Future<List<Model>> getModels() async {
      modelList = await ApiServices.getModel() as List<Model>;
      return modelList;
    }



  void addChat(List<ChatModel> new_chats){  
  chats = [...chats, ...new_chats];
    notifyListeners();
  }

    void sendMessage(String message) async{


      
      print(message);
      print(getModelSelected);
    }





}