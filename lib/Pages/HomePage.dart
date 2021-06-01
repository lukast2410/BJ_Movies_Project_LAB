import 'package:BJ_Movies_LAB/Models/Movie.dart';
import 'package:BJ_Movies_LAB/Pages/MovieDetailPage.dart';
import 'package:BJ_Movies_LAB/Pages/Widgets/MovieCard.dart';
import 'package:BJ_Movies_LAB/Pages/Widgets/MyDrawer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  static HomePage homePage;
  String username;

  static getInstance() =>
      homePage = (homePage == null) ? new HomePage() : homePage;

  void setUsername(name) {
    this.username = name;
  }

  @override
  State<StatefulWidget> createState() => _HomePageState(this.username);
}

class _HomePageState extends State<HomePage> {
  CarouselController controller = CarouselController();
  final String username;
  int currIdx = 0;
  var listImage = [
    'assets/movie/alladin.png',
    'assets/movie/angelhasfallen.png',
    'assets/movie/avenger.png',
    'assets/movie/c_marvel.png',
    'assets/movie/doraemon.png',
    'assets/movie/friendzone.png',
    'assets/movie/mib.png',
    'assets/movie/parasite.png',
    'assets/movie/spiderman.png',
  ];

  List<Movie> newMovies =
      movies.where((element) => element.category.contains("new")).toList();
  List<Movie> popularMovies =
      movies.where((element) => element.category.contains("popular")).toList();

  _HomePageState(this.username);

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  goToPrevious() {
    controller.previousPage(duration: Duration(seconds: 3), curve: Curves.ease);
  }

  goToNext() {
    controller.nextPage(duration: Duration(seconds: 3), curve: Curves.ease);
  }

  goToDetail(Movie movie) {
    MovieDetailPage.getInstance().setMovie(movie);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MovieDetailPage.getInstance()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movies",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Color(0xFFFFFFCC),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: MyDrawer(this),
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Stack(
            overflow: Overflow.clip,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CarouselSlider(
                    carouselController: controller,
                    items: listImage.map((e) {
                      return Builder(builder: (ctx) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(ctx).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(3, 3),
                                )
                              ],
                              image: DecorationImage(
                                  image: AssetImage(e), fit: BoxFit.fitHeight)),
                        );
                      });
                    }).toList(),
                    options: CarouselOptions(
                        initialPage: currIdx,
                        autoPlay: true,
                        height: 300.0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 900),
                        pauseAutoPlayOnTouch: true,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (idx, x) {
                          setState(() {
                            currIdx = idx;
                          });
                        }),
                  ),
                  Container(
                    constraints: BoxConstraints(maxHeight: 100.0),
                    child: Material(
                      color: Colors.transparent,
                      child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black45,
                        indicatorColor: Colors.black,
                        tabs: [
                          Tab(
                            text: 'New Movies',
                          ),
                          Tab(
                            text: 'Most Popular',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 200,
                    child: TabBarView(
                      children: [
                        ListView.builder(
                            itemCount: newMovies.length,
                            itemBuilder: (context, index) => MovieCard(
                                  movie: newMovies[index],
                                  state: this,
                                  tap: () => goToDetail(newMovies[index]),
                                )),
                        ListView.builder(
                            itemCount: popularMovies.length,
                            itemBuilder: (context, index) => MovieCard(
                                  movie: popularMovies[index],
                                  state: this,
                                  tap: () => goToDetail(popularMovies[index]),
                                )),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 110),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: ClipOval(
                    child: Material(
                      child: Ink(
                        padding: EdgeInsets.all(10),
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios_outlined),
                          iconSize: 30,
                          alignment: Alignment.center,
                          color: Colors.black,
                          highlightColor: Color(0xFFFFFFCC),
                          splashColor: Color(0xFFFFFFCC),
                          disabledColor: Colors.grey,
                          onPressed: () => controller.previousPage(
                              duration: Duration(milliseconds: 900),
                              curve: Curves.ease),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(top: 110),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: ClipOval(
                      child: Material(
                        child: Ink(
                          padding: EdgeInsets.all(10),
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios_outlined),
                            iconSize: 30,
                            alignment: Alignment.center,
                            color: Colors.black,
                            highlightColor: Color(0xFFFFFFCC),
                            splashColor: Color(0xFFFFFFCC),
                            disabledColor: Colors.grey,
                            onPressed: () => controller.nextPage(
                                duration: Duration(milliseconds: 900),
                                curve: Curves.ease),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
