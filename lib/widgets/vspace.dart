



import 'package:flutter/material.dart';

class Vspace extends StatelessWidget {

  final double height;
   Vspace(this.height);

  @override
  Widget build(BuildContext context){
    return SizedBox(height: height,);
  }
}
