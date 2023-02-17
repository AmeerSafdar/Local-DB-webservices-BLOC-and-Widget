// ignore_for_file: must_be_immutable, unused_element, use_rethrow_when_possible, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_widget/home_widget.dart';
import 'package:task8/helper/constants/common_key.dart';
import 'package:task8/helper/constants/dimensions.dart';
import 'package:task8/model/user_model.dart';
import 'package:task8/presentation_layer/widgets.dart/text_widget.dart';

class ListWidget extends StatefulWidget {
   ListWidget({
    required this.posts, super.key});
    List<UserData> posts;

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {

  @override
  void initState() {
    super.initState();
    HomeWidget.widgetClicked.listen((Uri? uri) => loadData());
    HomeWidget.setAppGroupId('${CommonKey.update}');
    sendAndUpdate();   
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkForWidgetLaunch();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal:Dimensions.PADDING_SIZE_SMALL,vertical:Dimensions.PADDING_SIZE_DEFAULT ),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.posts.length,
        itemBuilder: (context, index) {
          UserData data = widget.posts[index];
          return Card(
            child: ListTile(
              title: TextWidgets(txt:'${data.first_name.toString()} ${data.last_name.toString()}'),
              leading: Image(image: MemoryImage(data.img!))
            ),
          );
        },
      ),
    );
  }

 void sendAndUpdate() async{
    await sendData();
    await updateWidget();
  }

 void _checkForWidgetLaunch() async {
   await HomeWidget.initiallyLaunchedFromHomeWidget();
  }

 Future<void> sendData() async {
    try {
      for(int i=0;i<widget.posts.length;i++){
        HomeWidget.saveWidgetData<String>('${CommonKey.nameKey}$i', widget.posts[i].first_name);
      }
    } on PlatformException catch (exception) {
      throw exception;
    }
  }

 Future<Future<bool?>>  updateWidget() async {
    try {
      return HomeWidget.updateWidget(
          name: '${CommonKey.homeWidget}', iOSName: '${CommonKey.homeWidget}');
    } on PlatformException catch (exception) {
      throw exception;
    }
  }
}

void loadData() async {
    for (var i = 0; i < 6; i++) {
    await HomeWidget.getWidgetData<String>('${CommonKey.nameKey}i');
    }
  }

void backgroundCallback(Uri? data) async {

  if (data!.host == '${CommonKey.update}') {
    for (var i = 0; i < 6; i++) {
    await HomeWidget.getWidgetData<String>('${CommonKey.nameKey}i');
    }
    await HomeWidget.updateWidget(
        name: '${CommonKey.homeWidget}', iOSName: '${CommonKey.homeWidget}');
  }
}
