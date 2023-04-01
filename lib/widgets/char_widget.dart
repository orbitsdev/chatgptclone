import 'package:chatgpt/constants/constant.dart';
import 'package:chatgpt/helpers/assets.dart';
import 'package:chatgpt/widgets/hspace.dart';
import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class ChatWidget extends StatelessWidget {
  final String message;
  final int index;

  const ChatWidget({super.key, required this.message, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(8),
      color: index == 0 ? Colors.transparent : cardColor,
      child: Row(
      
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Image.asset(
              Assets.image_path(index == 0 ? 'b.png' : 'chatgpt-icon.png'),
              width: 26,
              height: 26,
            ),
          ),
          Hspace(8),
          Expanded(
            child: Container(
              
                margin: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: index == 0
                    ? Text(
                        message,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                           height: 1.5,
                          color: Colors.grey.shade300,
                          fontSize: 16,
                        ),
                      )
                    : AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            message.trim(),
                            textStyle: TextStyle(
                               height: 1.5,
                              color: Colors.grey.shade100,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )),
          ),
          if (index != 0)
            Row(
              children: [
                Hspace(8),
                Icon(
                  Icons.thumb_up_outlined,
                  color: Colors.grey.shade400,
                  size: 20,
                ),
                Hspace(8),
                Icon(
                  Icons.thumb_down_outlined,
                  color: Colors.grey.shade400,
                  size: 20,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
