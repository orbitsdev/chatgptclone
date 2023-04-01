import 'package:chatgpt/constants/constant.dart';
import 'package:chatgpt/models/model.dart';
import 'package:chatgpt/providers/model_provider.dart';
import 'package:chatgpt/sample/data.dart';
import 'package:chatgpt/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({Key? key}) : super(key: key);

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String? currentModel;

  @override
  Widget build(BuildContext context) {

    final modelProvider = Provider.of<ModelProvider>(context,listen:false);
    currentModel = modelProvider.getModelSelected;  
    
    return FutureBuilder(
      future:modelProvider.getModels(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: Text(
            snapshot.error.toString(),
            style: TextStyle(color: Colors.orange),
          ));
        } else {  
          return snapshot.data == null || snapshot.data!.isEmpty
              ? SizedBox.shrink()
              : FittedBox(
                child: DropdownButton(
                    iconEnabledColor: Colors.white,
                    dropdownColor: scaffoleBackground,
                    value:currentModel,
                    items: List<DropdownMenuItem<String>>.generate(snapshot.data!.length, (index) => DropdownMenuItem(
                        value: snapshot.data![index].id,
                        child: Text(snapshot.data![index].id as String, style: TextStyle(color: Colors.white),)),),
                        onChanged: (value) {
                      setState(() {
                        currentModel = value;
                      });
                          modelProvider.setModelSelected(value.toString());
                          print(modelProvider.getModelSelected);
                    }),
              );
        }
      },
    );
  }
}
