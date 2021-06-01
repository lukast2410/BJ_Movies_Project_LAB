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
];