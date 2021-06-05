class Movie {
  final String imagePath, title, description, genre, category;

  Movie({
    this.imagePath,
    this.title,
    this.description,
    this.genre,
    this.category
  });
}

List<Movie> movies = [
  Movie(
    imagePath: "assets/movie/avenger.png",
    title: "Avenger",
    genre: "Action, Superhero, Adventure, Sci-Fi",
    description: "The Avengers, is a 2012 American superhero film based on the Marvel Comics superhero team of the same name.",
    category: "new"
  ),
  Movie(
    imagePath: "assets/movie/parasite.png",
    title: "Parasite",
    genre: "Comedy, Mistery, Thriller, Drama",
    description: "Parasite is a 2019 South Korean black comedy thriller film directed by Bong Joon-ho, who co-wrote the screenplay with Han Jin-won.",
    category: "new and popular"
  ),
  Movie(
    imagePath: "assets/movie/spiderman.png",
    title: "Spiderman",
    genre: "Action, Superhero, Fantasy, Sci-Fi",
    description: "Spider-Man is a fictional superhero created by writer-editor Stan Lee and writer-artist Steve Ditko.",
    category: "new"
  ),
  Movie(
    imagePath: "assets/movie/doraemon.png",
    title: "Doraemon",
    genre: "Comedy, Sci-Fi, Fantasy",
    description: "Doraemon is a Japanese manga series written and illustrated by Fujiko Fujio.",
    category: "popular"
  ),
  Movie(
    imagePath: "assets/movie/mib.png",
    title: "Man In Black",
    genre: "Action, Comedy, Sci-Fi, Buddy",
    description: "Men in Black (MIB) is a secret agency that polices these aliens, protects Earth from extraterrestrial threats, and uses memory-erasing neuralyzers to keep alien activity a secret.",
    category: "popular"
  ),
  Movie(
    imagePath: "assets/movie/alladin.png",
    title: "Aladdin",
    genre: "Adventure, Family, Fantasy",
    description: "Aladdin who regularly steals to get by with the aid of his pet monkey, Abu. One day while roaming the streets, Aladdin spots a beautiful girl who gets in trouble after giving away bread to children without paying.",
    category: "regular"
  ),
  Movie(
    imagePath: "assets/movie/angelhasfallen.png",
    title: "Angel Has Fallen",
    genre: "Action, Thriller",
    description: "The film starts with Mike Banning (Gerard Butler) undergoing a military training exercise in which he runs through a building while being shot at. He takes out all the targets in his way until he makes it outside the facility and gets shot himself by his teammate Wade Jennings (Danny Huston).",
    category: "regular"
  ),
  Movie(
    imagePath: "assets/movie/c_marvel.png",
    title: "Captain Marvel",
    genre: "Adventure, Sci-Fi, Action",
    description: "In 1995, on the Kree Empire's capital planet of Hala, warrior and Starforce member Vers suffers from recurring nightmares involving an older woman. Yon-Rogg, her mentor and commander, warns her to control her abilities while the Supreme Intelligence, an organic artificial intelligence who acts as the ruler of the Kree, urges her to keep her emotions in check.",
    category: "regular"
  ),
  Movie(
    imagePath: "assets/movie/friendzone.png",
    title: "Frienzone",
    genre: "Romance",
    description: "Boyo's life changed dramatically when her boyfriend asked to break up. Also, she became unemployed because of her friend, Stud, who brought strangers to their home. Boyo and Boom decided to kick out Stud and look for a new person to stay with them. Boyo eventually got a recommendation from Amm and Bern, who was Good, a freelance artist.",
    category: "regular"
  ),
];