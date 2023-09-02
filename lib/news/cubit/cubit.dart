import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/news/cubit/states.dart';

import '../../local/cashHelper.dart';
import '../../remote/dio_helper.dart';
import '../../web_view/newscreens/business.dart';
import '../../web_view/newscreens/science.dart';
import '../../web_view/newscreens/sports.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() :super(InitialState());

  //get chanded => null;


  static NewsCubit get(context) => BlocProvider.of(context);
  int current_index = 0;
  List<BottomNavigationBarItem> MoveScreens = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: "Business"
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: "Sports"
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: "Science"
    ),

  ];


  List<Widget> Screens = [

    Business(),
    Sports(),
    Science(),

  ];

  void ChangeBottomNavBar(int index) {
    current_index = index;
    if (index == 1) {
      getSports();
    }
    else if (index == 2) {
      getSciences();
    }
    emit(BottomNavBarState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(BusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query:
    {
      'country': 'eg',
      'category': 'business',
      'apikey': '5ef30d2cb7bc49f797d7ea0f0904c3ee'
    }
    ).then((value) {
      business = value.data['articles'];
      print("length:- ${business.length}");

      emit(getBusinessSuccessfulyState());
    }).catchError((error) {
      print(error.toString());
      emit(getBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> Sport = [];

  void getSports() {
    emit(SportLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query:
    {
      'country': 'eg',
      'category': 'sport',
      'apikey': '5ef30d2cb7bc49f797d7ea0f0904c3ee'
    }
    ).then((value) {
      Sport = value.data['articles'];
      print("length:- ${business.length}");
      emit(getSportSuccessfulyState());
    }).catchError((error) {
      print(error.toString());
      emit(getSportErrorState(error.toString()));
    });
  }


  List<dynamic> science = [];

  void getSciences() {
    emit(ScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query:
    {
      'country': 'eg',
      'category': 'science',
      'apikey': '5ef30d2cb7bc49f797d7ea0f0904c3ee'
    }
    ).then((value) {
      science = value.data['articles'];
      print("length:- ${business.length}");
      emit(getScienceSuccessfulyState());
    }).catchError((error) {
      print(error.toString());
      emit(getScienceErrorState(error.toString()));
    });
  }

  bool mode = true;
  ThemeMode ModeLight = ThemeMode.light;

  void changeMode(int x) {
    if (x == 1) {
      mode = !mode;
      CashHelper.PutBoolean("isDark", mode).then((value) {
        emit(ModeState());
        print("ambjnk,");
        // print(mode);
        //print(value);
      });
    }
    else {
      bool? isdark = CashHelper.getBoolean("isDark");

      print(isdark);
      if (isdark == null) {
        mode = !mode;
        CashHelper.PutBoolean("isDark", mode).then((value) {
          emit(ModeState());
          print("ambjnk,");
          //  print(mode);
          // print(value);
        });
      }
      else {
        mode = isdark;
        //print(mode);
        emit(ModeState());
      }
    }
  }

  List<dynamic> search = [];

  void getSearch(value) {
    emit(SearchLoadingState());
    DioHelper.getData(url: 'v2/everything', query:
    {

      'q': '$value',
      'apikey': '5ef30d2cb7bc49f797d7ea0f0904c3ee'
    }
    ).then((value) {
      search = value.data['articles'];
      print("length:- ${search.length}");
      emit(getSearchSuccessfulyState());
    }).catchError((error) {
      print(error.toString());
      emit(getSearchErrorState(error.toString()));
    });
  }


}
