import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class MovieDetailLoading extends StatefulWidget {
  const MovieDetailLoading({Key key}) : super(key: key);

  @override
  _MovieDetailLoadingState createState() => _MovieDetailLoadingState();
}

class _MovieDetailLoadingState extends State<MovieDetailLoading> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.black,
      child: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Container(
                color: Colors.grey,
                height: height / 1.6,
              ),
            ),

            Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 350,
                    ),
                    Center(
                      child: ClipRect(
                        child: BackdropFilter(
                          filter:  ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            height: height - 350,
                            width: width / 1.1,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.4),
                                    Colors.black,
                                  ],
                                ),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20,right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey,
                                    highlightColor: Colors.white,
                                    child: Container(
                                      width: 120,
                                      height: 20,
                                      color :Colors.grey
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: Colors.grey,
                                        highlightColor: Colors.white,
                                        child: Container(
                                            width: 60,
                                            height: 20,
                                            color :Colors.grey
                                        ),
                                      ),
                                      SizedBox(
                                        width: 35,
                                      ),
                                      Shimmer.fromColors(
                                        baseColor: Colors.grey,
                                        highlightColor: Colors.white,
                                        child: Container(
                                            width: 60,
                                            height: 20,
                                            color :Colors.grey
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.grey,
                                          highlightColor: Colors.white,
                                          child: Container(
                                              width: 50,
                                              height: 20,
                                              color :Colors.grey
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    color: Colors.white24,
                                  ),
                                   Shimmer.fromColors(
                                    baseColor: Colors.grey,
                                    highlightColor: Colors.white,
                                    child: Container(
                                        width: double.infinity,
                                        height: 40,
                                        color :Colors.grey
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey,
                                    highlightColor: Colors.white,
                                    child: Container(
                                        width: double.infinity,
                                        height: 20,
                                        color :Colors.grey
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey,
                                    highlightColor: Colors.white,
                                    child: Container(
                                        width: double.infinity,
                                        height: 20,
                                        color :Colors.grey
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      )
    );
  }
}
