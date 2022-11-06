// ignore_for_file: prefer_const_constructors, avoid_unnecessary_container

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook/Services/business_news_services.dart';
import 'package:flutter_facebook/Services/health_news_services.dart';
import 'package:flutter_facebook/Services/sport_news_services.dart';
import 'package:flutter_facebook/Services/top_news_services.dart';
import 'package:flutter_facebook/cubit/business_cubit/business_news_cubit.dart';
import 'package:flutter_facebook/cubit/health_cubit/health_news_cubit.dart';
import 'package:flutter_facebook/cubit/sport_cubit/sport_news_cubit.dart';
import 'package:flutter_facebook/cubit/top_news_cubit/top_news_cubit.dart';
import 'package:flutter_facebook/view/home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(
    BlocProvider(
      create: (context) {
        return TopNewsCubit(NewsServices());
      },
      child: BlocProvider(
        create: (context) {
          return SportNewsCubit(SportNewsServices());
        },
        child: BlocProvider(
          create: (context) {
            return BusinessNewsCubit(BusinessNewsServices());
          },
          child: BlocProvider(
            create: (context) {
              return HealthNewsCubit(HealthNewsServices());
            },
            child: MyApp(),
          ),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          theme: ThemeData(
            fontFamily: 'myfontAR',
          ),
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        );
      },
    );
  }
}
