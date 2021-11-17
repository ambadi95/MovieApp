import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'movie_list_card.dart';

class MovieListLoading extends StatefulWidget {
  const MovieListLoading({Key key}) : super(key: key);

  @override
  _MovieListLoadingState createState() => _MovieListLoadingState();
}

class _MovieListLoadingState extends State<MovieListLoading> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.black,
      child: Container(
          color: Colors.black,
          child: Container(
            height: height - 161,
            child: GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 3,
                    childAspectRatio: 0.64),
                itemCount: 12,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 20,
                              width: 50,
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(15)
                            ),
                          ),
                        )
                    ),
                  );
                }
          )
        )
      ),
    );
  }
}
