



import 'package:chatgpt/constants/constant.dart';
import 'package:chatgpt/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';

class HomeService {


static void showBottomSheet({required BuildContext context}) async {
      await showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                )
              ),
              backgroundColor: scaffoleBackground,
              context: context, builder: (context)=> Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('Chosen Model', style: TextStyle(color: Colors.white),),
                )),

                Flexible(
                  
                  child: DropdownWidget()),
              ],
            ));
  }
}