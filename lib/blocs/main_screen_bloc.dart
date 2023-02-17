// ignore_for_file: use_rethrow_when_possible, unused_field

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/blocs/main_screen_event.dart';
import 'package:task8/blocs/main_screen_state.dart';
import 'package:task8/enums/mainscreen_status_enum.dart';
import 'package:task8/model/user_model.dart';
import 'package:task8/repository/api_data_repo/api_data_implements.dart';

class MainBloc extends Bloc<MainEvents,MainStates>{
  final PostRepository _postRepository = PostRepository();
  List<UserData>? data;
  MainBloc():super(MainStates()){
    on<GetData>(_getApiData);
  }

  Future<void> _getApiData(GetData event, Emitter<MainStates> emit) async{
    try {
      emit(state.copyWith(status: Status.loading));
      data=await _postRepository.fetchPosts();
      emit(
      state.copyWith(
        status: Status.success,
        data: data,
      )
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: Status.error
        )
      );
    }
  }
}