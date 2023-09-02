
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:newsapp/remote/dio_helper.dart';
import 'package:newsapp/style/Themes.dart';

import 'local/cashHelper.dart';
import 'news/cubit/cubit.dart';
import 'news/cubit/states.dart';
import 'news/newapp.dart';
// hi
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  await CashHelper.init();
  Widget widget_;
  bool? isdark =CashHelper.getBoolean("isDark");
  // bool? onboarding=CashHelper.getData('onboarding');
  //token=CashHelper.getData('token');
  var uId=CashHelper.getData('uId');
  // print(onboarding);

  // print(token);
  // if(onboarding!=null)
  //   {
  //     if(token!=null) widget_=ShopLayout();
  //     else
  //       widget_=Shop_Login_Screen();
  //   }
  // else
  //   widget_=OnboardingScreen();
  runApp(MyApp(Isdark: isdark,));
}

class MyApp extends StatelessWidget {

  bool? Isdark;

  MyApp({
    this.Isdark,

  });
  // This widget is the root of your application.
  @override
  Widget build (BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (BuildContext context)=>NewsCubit()..getBusiness()..changeMode(0)),

      ],

      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          return  MaterialApp( home:NewApp(),
            debugShowCheckedModeBanner: false,
            theme: lighttheme,
            darkTheme: darktheme,
            themeMode:NewsCubit.get(context).mode?ThemeMode.dark:ThemeMode.light,
          );
        },

      ),
    );
  }
}