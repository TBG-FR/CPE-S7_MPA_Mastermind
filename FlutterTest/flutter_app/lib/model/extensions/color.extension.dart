
import 'dart:convert';
import 'package:flutter/material.dart';

class ColorExtension
{
  static String toJson(Color color)
  {
    return jsonEncode(color.toString());
  }

  static Color fromJson(String json)
  {
    String colorString = jsonDecode(json);
    String valueString = colorString.split('(0x')[1].split(')')[0];
    int value = int.parse(valueString, radix: 16);
    return new Color(value);
  }
}

/*
Color color = new Color(0x12345678);
String colorString = color.toString(); // Color(0x12345678)
String valueString = colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
int value = int.parse(valueString, radix: 16);
Color otherColor = new Color(value);
 */