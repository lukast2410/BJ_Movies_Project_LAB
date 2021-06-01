import 'package:BJ_Movies_LAB/Models/Movie.dart';
import 'package:flutter/material.dart';

class MovieDetailPage extends StatefulWidget {
  static MovieDetailPage detailPage;
  Movie movie;

  static getInstance() =>
      detailPage = (detailPage == null) ? new MovieDetailPage() : detailPage;

  void setMovie(Movie movie) {
    this.movie = movie;
  }

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState(this.movie);
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final Movie movie;
  String errorMessage, review;
  bool error = false;

  _MovieDetailPageState(this.movie);

  validateReview() {
    setState(() {
      error = false;
      if (review == null) return;
      if (review.length > 1000) {
        error = true;
        errorMessage = "Your movie review must less than 1000 characters.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movie Detail",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Color(0xFFFFFFCC),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 35),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${movie.title}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Image(image: AssetImage(movie.imagePath), fit: BoxFit.fill),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Genre",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 50),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        Text(
                          "${movie.genre}",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                "Synopsis",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "${movie.description}",
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                "Movie Review",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: kElevationToShadow[2],
                    color: Colors.white),
                height: 100.0,
                child: TextField(
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  maxLines: 4,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Input your movie review here',
                      hintStyle: TextStyle(color: Colors.black54, fontSize: 18),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                  onChanged: (val) => review = val,
                ),
              ),
              error
                  ? Text(
                      errorMessage,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    )
                  : SizedBox(height: 0),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 75),
                child: RaisedButton(
                  elevation: 5.0,
                  color: Color(0xAA007663),
                  padding: EdgeInsets.all(13.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  onPressed: () => validateReview(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
