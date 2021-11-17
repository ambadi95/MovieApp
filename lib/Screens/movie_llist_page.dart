import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Model/api_service.dart';
import 'package:movie_app/Screens/movile_detail_page.dart';
import 'package:movie_app/Widgets/movie_list_card.dart';
import 'package:movie_app/Widgets/movie_list_screen_loading.dart';
import 'package:movie_app/Widgets/search_bar.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key key}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  TextEditingController search = new TextEditingController();

  String searchText = 'Thor';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Browse",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Movies',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white38),
            ),
          ]),
          backgroundColor: Colors.black,
          actions: [
            Icon(
              Icons.menu,
              color: Colors.white,
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SearchBar(
                controller: search,
                onChanged: (value) async => {
                  setState(() {
                    searchText = value;
                  })
                },
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: ApiSerices().fetchMovieList(searchText),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: MovieListLoading());
                    } else if (snapshot.data == 'error') {
                      return Container(
                        child: Center(
                          child: Text(
                            'No movies found!',
                            style: TextStyle(color: Colors.white38),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        height: height - 161,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 3,
                                    childAspectRatio: 0.64),
                            itemCount: snapshot.data.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MovileDetailsPage(
                                                        data: snapshot
                                                            .data[index])))
                                      },
                                  child: MovieCard(
                                    data: snapshot.data[index],
                                  ));
                            }),
                      );
                    }
                  }),
            ],
          ),
        )),
      ),
    );
  }
}
