import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/Database/local_database.dart';
import 'package:movie_app/Model/api_service.dart';
import 'package:movie_app/Response/movie_list_response.dart';
import 'package:movie_app/Widgets/movie_detail_screen_loading.dart';

class MovileDetailsPage extends StatefulWidget {
  Search data;

  MovileDetailsPage({Key key, this.data}) : super(key: key);

  @override
  _MovileDetailsPageState createState() => _MovileDetailsPageState();
}

class _MovileDetailsPageState extends State<MovileDetailsPage>
    with TickerProviderStateMixin {
  Animation animation;
  AnimationController _controller;
  DatabaseHelper databaseHelper = new DatabaseHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: FutureBuilder(
            future: ApiSerices().fetchMovieDetails(widget.data.imdbID),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return MovieDetailLoading();
              } else {
                return Container(
                  color: Colors.black,
                  child: Stack(
                    children: [
                      snapshot.data[0]['Poster'] == 'N/A' ? Container(
                        color: Colors.grey,
                      ):
                      Container(
                        height: height / 1.6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage('${snapshot.data[0]['Poster']}'),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 350,
                              ),
                              FadeTransition(
                                opacity: animation,
                                child: Center(
                                  child: ClipRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 10.0, sigmaY: 10.0),
                                      child: Container(
                                        height: height - 240,
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
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 20, right: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${snapshot.data[0]['Title']}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  snapshot.data[0]['Metascore'] == 'N/A' ? Container():
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star_outline_rounded,
                                                        color: Colors.white38,
                                                        size: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        '${snapshot.data[0]['Metascore']}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 14,
                                                            color: Colors.white),
                                                      ),
                                                      SizedBox(
                                                        width: 35,
                                                      ),
                                                    ],
                                                  ),

                                                  snapshot.data[0]['Runtime'] == 'N/A' ? Container():
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.access_time,
                                                        color: Colors.white38,
                                                        size: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        '${snapshot.data[0]['Runtime']}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 14,
                                                            color: Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'Hologram',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      snapshot.data[0]['Genre'].split(',').length == 0 ? Container() :
                                                      Container(
                                                        height: 25,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Colors.white24,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 4,
                                                                  bottom: 5,
                                                                  left: 7,
                                                                  right: 7),
                                                          child: Text(
                                                            '${snapshot.data[0]['Genre'].split(',')[0]}',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ) ,
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      snapshot.data[0]['Genre'].split(',').length > 1 ?
                                                      Container(
                                                        height: 25,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Colors.white24,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 4,
                                                                  bottom: 5,
                                                                  left: 7,
                                                                  right: 7),
                                                          child:
                                                          Text(
                                                            '${snapshot.data[0]['Genre'].split(',').length > 1 ? snapshot.data[0]['Genre'].split(',')[1] : " "}',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ) :Container()
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Divider(
                                                color: Colors.white24,
                                              ),
                                              snapshot.data[0]['Plot'] == 'N/A' ? Container():
                                              Text(
                                                '${snapshot.data[0]['Plot']}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13,
                                                    color: Colors.white54,
                                                    wordSpacing: 2,
                                                    height: 1.5),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              snapshot.data[0]['Director'] == 'N/A' ? Container():
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Director:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 13,
                                                        color: Colors.white54),
                                                  ),
                                                  SizedBox(
                                                    width: 250,
                                                    child: Text(
                                                      ' ${snapshot.data[0]['Director']}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 13,
                                                          color:
                                                              Colors.white54),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Table(
                                                columnWidths: {
                                                  0: FlexColumnWidth(1),
                                                  1: FlexColumnWidth(6),
                                                },
                                                defaultVerticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .top,
                                                children: [
                                                  TableRow(children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child:
                                                          snapshot.data[0]['Writer'] == 'N/A' ? Container():
                                                      Text(
                                                        'Writer:',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 13,
                                                          color: Colors.white54,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child:  snapshot.data[0]['Writer'] == 'N/A' ? Container():
                                                      Text(
                                                        '${snapshot.data[0]['Writer']}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 13,
                                                            color:
                                                                Colors.white54),
                                                      ),
                                                    ),
                                                  ]),
                                                  TableRow(children: [
                                                    snapshot.data[0]['Actors'] == 'N/A' ? Container():
                                                    Text(
                                                      'Actors:',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 13,
                                                          color:
                                                              Colors.white54),
                                                    ),
                                                    snapshot.data[0]['Actors'] == 'N/A' ? Container():
                                                    Text(
                                                      '${snapshot.data[0]['Actors']}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 13,
                                                          color:
                                                              Colors.white54),
                                                    ),
                                                  ]),
                                                ],
                                              ),
                                            ],
                                          ),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 50),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ]),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }));
  }
}
