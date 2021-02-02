import 'package:app_my_movies/presentation/widgets/movie_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

 main()  {
  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp]
  );
  runApp(MovieApp());

}


