import 'package:flutter/material.dart';

class Dimensions{
  static double getHeight(BuildContext context, double height){
    return (MediaQuery.of(context).size.height / 926)*height;
  }
  static double getWidth(BuildContext context, double width){
    return (MediaQuery.of(context).size.width / 428)*width;
  }
}