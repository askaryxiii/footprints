import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook/cubit/business_cubit/business_news_cubit.dart';
import 'package:flutter_facebook/cubit/health_cubit/health_news_cubit.dart';
import 'package:flutter_facebook/cubit/sport_cubit/sport_news_cubit.dart';
import 'package:flutter_facebook/cubit/top_news_cubit/top_news_cubit.dart';
import 'package:flutter_facebook/view/home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SportNewsCubit>(context).getSportNewsApi();
    BlocProvider.of<TopNewsCubit>(context).getNewsApi();
    BlocProvider.of<BusinessNewsCubit>(context).getBusinessNewsApi();
    BlocProvider.of<HealthNewsCubit>(context).getHealthNews();
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: SizedBox(
        height: Adaptive.h(5),
        width: Adaptive.h(5),
        child: CircularProgressIndicator(
          strokeWidth: Adaptive.w(1),
          color: const Color.fromARGB(255, 39, 39, 39),
        ),
      )),
    );
  }
}
