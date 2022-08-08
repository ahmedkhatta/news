import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/service/cache_helper.dart';

import 'package:news/data/service/dio_helper.dart';
import 'package:news/utilty/app_url.dart';
import 'package:news/view/screens/busines_screen.dart';

import 'package:news/view/screens/since_screen.dart';
import 'package:news/view/screens/sports_screen.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: "business"),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: "sports"),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: "science"),
  ];
  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const SinceScreen(),
  ];
  List<String> titleAPPBar = [
    "business",
    "sports",
    "science",
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(NewsBottomNavInitial());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];


  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: url, query: {
      "country": "eg",
      "category": "business",
      "apiKey": "9c457cf977be4dcba0933e5fb3d2a7a5",
    }).then((value) {
      business = value.data["articles"];

      emit(NewsGetBusinessSuccessState());
    }).catchError((onError) {
      emit(NewsGetBusinessErrorState(onError.toString()));
    });
  }

  void getSports() {
    emit(NewsGetSportsLoadingState());

    DioHelper.getData(url: url, query: {
      "country": "eg",
      "category": "sports",
      "apiKey": "9c457cf977be4dcba0933e5fb3d2a7a5",
    }).then((value) {
      sports = value.data["articles"];

      emit(NewsGetSportsSuccessState());
    }).catchError((onError) {
      emit(NewsGetSportsErrorState(onError.toString()));
    });
  }

  void getSciences() {
    emit(NewsGetSciencesLoadingState());
    DioHelper.getData(url: url, query: {
      "country": "eg",
      "category": "science",
      "apiKey": "9c457cf977be4dcba0933e5fb3d2a7a5",
    }).then((value) {
      science = value.data["articles"];

      emit(NewsGetSciencesSuccessState());
    }).catchError((onError) {
      emit(NewsGetSciencesErrorState(onError.toString()));
    });
  }

  bool isDark = false;
  ThemeMode appMode = ThemeMode.dark;

  void changeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: "isDark", value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }


  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    search = [];
    DioHelper.getData(url: 'v2/everything', query: {
      "q": "$value",
      "apiKey": "9c457cf977be4dcba0933e5fb3d2a7a5",
    }).then((value) {
      search = value.data["articles"];

      emit(NewsGetSearchSuccessState());
    }).catchError((onError) {
      emit(NewsGetSearchErrorState(onError.toString()));
    });
  }
}
