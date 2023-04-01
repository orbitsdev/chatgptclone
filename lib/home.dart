import 'package:chatgpt/constants/constant.dart';
import 'package:chatgpt/helpers/assets.dart';
import 'package:chatgpt/models/char_model.dart';
import 'package:chatgpt/providers/model_provider.dart';
import 'package:chatgpt/sample/data.dart';
import 'package:chatgpt/services/api_services.dart';
import 'package:chatgpt/services/home_service.dart';
import 'package:chatgpt/widgets/char_widget.dart';
import 'package:chatgpt/widgets/vspace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isTyping = false;

  TextEditingController _messageController = TextEditingController();
  late FocusNode _focusNode;
  late ScrollController _scrollController;


  @override
  void initState() {
    // TODO: implement initState

    _focusNode = FocusNode();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose


  _scrollController.dispose();
    _messageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
  List<ChatModel> chats = [];


  void scrollListToEnd(){
    _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(seconds: 2), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    final modelProvider = Provider.of<ModelProvider>(context, listen: false);

    void setNewChat(String message, String model_id) async {

       

      try {

        ChatModel new_chat = ChatModel(chatIndex: 0, message: message);
        setState(() {
          _isTyping = true;
          chats.add(new_chat);
           _messageController.clear();
           _focusNode.unfocus();

        });
       
         ChatModel ai_response =   await ApiServices.sendMessage(message, model_id);

           setState(() {
          _isTyping = true;
          chats.add(ai_response);

        });
       
      
      } catch (e) {
        print(e);
      } finally {
        setState(() {
          scrollListToEnd();
          _isTyping = false;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            Assets.image_path('chatgpt-icon.png'),
          ),
        ),
        title: Text('ChatGPT'),
        actions: [
          IconButton(
              onPressed: () {
                HomeService.showBottomSheet(context: context);
              },
              icon: Icon(Icons.more_vert_outlined))
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
                child: ListView.builder(
              controller: _scrollController,
              itemCount: chats.length,
              itemBuilder: (context, index) => ChatWidget(
                message: chats[index].message as String,
                index: chats[index].chatIndex,
              ),
            )),
            ...[
              Vspace(15),
              if (_isTyping)
                const SpinKitThreeBounce(
                  color: Colors.white,
                  size: 20,
                ),
              Vspace(15),
              Container(
                color: cardColor,
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        focusNode: _focusNode,
                        style: TextStyle(color: Colors.white),
                        onSubmitted: (value) async {
                          setNewChat(value, modelProvider.getModelSelected);
                        },
                        decoration: InputDecoration.collapsed(
                          hintText: 'How can i Help you',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        controller: _messageController,
                      ),
                    ),
                    if(_isTyping == false) IconButton(
                        onPressed: () async {
                          setNewChat(_messageController.text, modelProvider.getModelSelected);
                        },
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        )),
                  ],
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
