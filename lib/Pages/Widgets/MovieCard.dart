import 'package:BJ_Movies_LAB/Models/Movie.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final Function tap;
  final State state;

  MovieCard({this.movie, this.tap, this.state});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: 200,
        width: MediaQuery.of(state.context).size.width / 2,
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(state.context).size.width / 3.5,
                  height: 155,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Image(
                      image: AssetImage(movie.imagePath), fit: BoxFit.cover),
                ),
                Container(
                  width: MediaQuery.of(state.context).size.width / 4 * 2.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        children: <Widget>[
                          Text(
                            '${movie.title}',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        children: <Widget>[
                          Text(
                            'Genre: ${movie.genre}',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        children: <Widget>[
                          Text(
                            '${movie.description}',
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          elevation: 5,
        ),
      ),
    );
  }
}
