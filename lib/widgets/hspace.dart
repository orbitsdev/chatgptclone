



import 'package:flutter/material.dart';

class Hspace extends StatelessWidget {

  final double width;
   Hspace(this.width);

  @override
  Widget build(BuildContext context){
    return SizedBox(width: width,);
  }
}
