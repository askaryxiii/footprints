import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook/cubit/health_cubit/health_news_cubit.dart';
import 'package:flutter_facebook/model/news.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HealthNews extends StatefulWidget {
  const HealthNews({Key? key}) : super(key: key);

  @override
  State<HealthNews> createState() => _HealthNewsState();
}

class _HealthNewsState extends State<HealthNews> {
  News? healthNewsData;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<HealthNewsCubit, HealthNewsState>(
        builder: (context, state) {
      if (state is HealthNewsLoading) {
        return Center(
            child: SizedBox(
          height: Adaptive.h(5),
          width: Adaptive.h(5),
          child: CircularProgressIndicator(
            strokeWidth: Adaptive.w(1),
            color: const Color.fromARGB(255, 39, 39, 39),
          ),
        ));
      } else if (state is HealthNewsLoaded) {
        healthNewsData =
            BlocProvider.of<HealthNewsCubit>(context).healthNewsModel;
        return topHealthNewsLoaded();
      } else if (state is HealthNewsFailure) {
        return const Center(
          child: Text('Something Went Wrong'),
        );
      } else {
        return Container();
      }
    }));
  }

  Container topHealthNewsLoaded() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) {
                return Opacity(
                  opacity: currentPage == index ? 1.0 : 0.7,
                  child: Container(
                    margin: EdgeInsets.only(bottom: Adaptive.h(5)),
                    padding: EdgeInsets.fromLTRB(Adaptive.h(1), Adaptive.h(0),
                        Adaptive.h(1), Adaptive.h(0)),
                    child: Column(
                      children: [
                        Container(
                            width: Adaptive.w(80),
                            height: Adaptive.h(25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(Adaptive.w(1)),
                                  topRight: Radius.circular(Adaptive.w(1))),
                            ),
                            child: Container(
                              child: healthNewsData!
                                          .articles![index].urlToImage ==
                                      null
                                  ? Image.asset('assets/img/placeholder.jpg')
                                  : FadeInImage.assetNetwork(
                                      width: double.infinity,
                                      height: double.infinity,
                                      placeholder: 'assets/img/loading.gif',
                                      image: healthNewsData!
                                          .articles![index].urlToImage
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                            )),
                        Expanded(
                          child: Container(
                            width: Adaptive.w(80),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  const BoxShadow(
                                    color: Color.fromARGB(255, 223, 223, 223),
                                    blurRadius: 5.0,
                                    spreadRadius: 3.0,
                                    offset: Offset(0.0, 3.0),
                                  ),
                                ],
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(Adaptive.w(1)),
                                    bottomRight:
                                        Radius.circular(Adaptive.w(1))),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      Adaptive.w(4),
                                      Adaptive.w(1),
                                      Adaptive.w(1),
                                      Adaptive.w(1)),
                                  child: Text(
                                    healthNewsData!.articles![index].source!
                                                .name ==
                                            null
                                        ? 'Unknown Auther'
                                        : healthNewsData!
                                            .articles![index].source!.name
                                            .toString(),
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 166, 166, 166),
                                        fontSize: Adaptive.w(3.5),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: Adaptive.w(2),
                                      bottom: Adaptive.w(2)),
                                  child: Text(
                                    healthNewsData!.articles![index].title
                                        .toString(),
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color:
                                            const Color.fromRGBO(39, 39, 39, 1),
                                        fontSize: Adaptive.w(6),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    right: Adaptive.w(2),
                                  ),
                                  child: Text(
                                    healthNewsData!
                                                .articles![index].description ==
                                            null
                                        ? ''
                                        : healthNewsData!
                                            .articles![index].description
                                            .toString(),
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 49, 49, 49),
                                        fontSize: Adaptive.w(4.5)),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'اقرأ المزيد',
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 166, 166, 166),
                                                fontSize: Adaptive.w(4),
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: Adaptive.w(1),
                                          ),
                                          Icon(
                                            Icons.info,
                                            size: Adaptive.w(4.7),
                                            color: const Color.fromARGB(
                                                255, 166, 166, 166),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Adaptive.h(1),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: healthNewsData!.articles!.length,
              controller:
                  PageController(initialPage: 0, viewportFraction: 0.75),
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
