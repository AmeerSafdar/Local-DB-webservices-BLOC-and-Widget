import 'package:flutter/material.dart';
import 'package:task8/helper/constants/color_helper.dart';
import 'package:task8/presentation_layer/widgets.dart/text_widget.dart';

void buildSnackbar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration:const Duration(seconds: 1),
                    content:  TextWidgets(txt:msg) ,
                    backgroundColor: GREEN_COLOR,
             ));
  }