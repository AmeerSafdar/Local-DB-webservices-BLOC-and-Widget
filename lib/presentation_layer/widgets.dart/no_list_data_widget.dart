import 'package:flutter/material.dart';
import 'package:task8/helper/constants/dimensions.dart';
import 'package:task8/helper/constants/string_helper.dart';
import 'package:task8/helper/utils/styles.dart';
import 'package:task8/presentation_layer/widgets.dart/text_widget.dart';
class NoDataList extends StatelessWidget {
  const NoDataList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      child: ListView(
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        children: [
          Center(
            child: TextWidgets(
            txt: StringHelper.NO_DATA,
            style: CustomTextStyle.nameTextStyle,
           ))
       ],),
    );
  }
}