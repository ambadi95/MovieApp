import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Response/movie_list_response.dart';

class MovieCard extends StatefulWidget {
  Search data;
   MovieCard({Key key, this.data}) : super(key: key);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150,
        height: 150,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.data.poster == 'N/A' ? Container(
              height: 130,
              width: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                  // image: DecorationImage(
                  //     image: NetworkImage('${widget.data.poster}'),
                  //     fit: BoxFit.cover
                  // )
              ),
            ) :
            Container(
              height: 130,
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage('${widget.data.poster}'),
                  fit: BoxFit.cover
                )
              ),

            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text("${widget.data.title}", style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 5),
              child: Text("${widget.data.year}", style: TextStyle(
                  color: Colors.white,
                fontSize: 11,
                wordSpacing: 5

              ),),
            ),
          ],
        ),
      ),
    );
  }
}
