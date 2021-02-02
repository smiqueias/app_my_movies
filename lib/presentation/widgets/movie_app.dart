import 'package:app_my_movies/common/screenutil/screenutil.dart';
import 'package:app_my_movies/presentation/screens/home/home_screen.dart';
import 'package:app_my_movies/presentation/theme/app_color.dart';
import 'package:app_my_movies/presentation/theme/theme_text.dart';
import 'package:flutter/material.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      
      home: HomeScreen(),

    );
  }
}
