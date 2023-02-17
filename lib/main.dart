import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_widget/home_widget.dart';
import 'package:task8/blocs/main_screen_bloc.dart';
import 'package:task8/helper/constants/const.dart';
import 'package:task8/presentation_layer/views/home_page.dart';
import 'package:task8/presentation_layer/widgets.dart/listview_data.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dbHelper.initDb();
  HomeWidget.widgetClicked.listen((Uri? uri) => loadData());
  HomeWidget.registerBackgroundCallback(backgroundCallback);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider<MainBloc>(create: ((context) => MainBloc())),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
    );
  }
}