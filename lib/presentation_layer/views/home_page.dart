
// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/blocs/main_screen_bloc.dart';
import 'package:task8/blocs/main_screen_event.dart';
import 'package:task8/blocs/main_screen_state.dart';
import 'package:task8/enums/mainscreen_status_enum.dart';
import 'package:task8/helper/constants/string_helper.dart';
import 'package:task8/helper/extension/snackbar_helper.dart';
import 'package:task8/presentation_layer/widgets.dart/listview_data.dart';
import 'package:task8/presentation_layer/widgets.dart/no_list_data_widget.dart';
import 'package:task8/presentation_layer/widgets.dart/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _pullRefresh() async{
    BlocProvider.of<MainBloc>(context).add(GetData());
  }
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MainBloc>(context).add(GetData());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextWidgets(txt:StringHelper.MAIN_SCREEN),
      ),
      body: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: SafeArea(
          child: BlocConsumer<MainBloc, MainStates>(
            listener: (context, state) {
              if (state.status==Status.error) {
                buildSnackbar(context, StringHelper.ERROR_OCUR);
              }
            },
            builder: (context, state) {
              switch (state.status) {
                case Status.success:
                   return ListWidget(posts: state.data);
                case Status.loading:
                   return const Center(child: CircularProgressIndicator(),);
                default:
                  return const NoDataList();
              }
            },
          ),
        ),
      ),
    );
  } 
}


