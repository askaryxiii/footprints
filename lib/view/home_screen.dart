import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook/cubit/business_cubit/business_news_cubit.dart';
import 'package:flutter_facebook/cubit/health_cubit/health_news_cubit.dart';
import 'package:flutter_facebook/cubit/sport_cubit/sport_news_cubit.dart';
import 'package:flutter_facebook/cubit/top_news_cubit/top_news_cubit.dart';
import 'package:flutter_facebook/view/business_news.dart';
import 'package:flutter_facebook/view/general_news.dart';
import 'package:flutter_facebook/view/health_news.dart';
import 'package:flutter_facebook/view/sport_news.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<SportNewsCubit>(context).getSportNewsApi();
    BlocProvider.of<TopNewsCubit>(context).getNewsApi();
    BlocProvider.of<BusinessNewsCubit>(context).getBusinessNewsApi();
    BlocProvider.of<HealthNewsCubit>(context).getHealthNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Adaptive.h(17.5)),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      top: Adaptive.h(4), bottom: Adaptive.h(2)),
                  child: Image(
                    width: Adaptive.h(25),
                    image: const AssetImage(
                      'assets/img/logo.png',
                    ),
                    fit: BoxFit.fitWidth,
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(
                    Adaptive.w(1), Adaptive.w(0), Adaptive.w(1), Adaptive.w(0)),
                height: Adaptive.h(5),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(Adaptive.w(5)),
                    color: Colors.grey[300],
                  ),
                  labelColor: const Color.fromARGB(255, 39, 39, 39),
                  labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                  unselectedLabelColor: const Color.fromARGB(255, 49, 49, 49),
                  tabs: [
                    Tab(
                      child: Text(
                        'Top News',
                        style: TextStyle(fontSize: Adaptive.w(3.5)),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Sport',
                        style: TextStyle(fontSize: Adaptive.w(3.5)),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Business',
                        style: TextStyle(fontSize: Adaptive.w(3.5)),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Health',
                        style: TextStyle(fontSize: Adaptive.w(3.5)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GeneralNews(),
            SportNews(),
            BusinessNews(),
            HealthNews(),
          ],
        ),
      ),
    );
  }
}
