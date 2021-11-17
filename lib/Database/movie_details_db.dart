class MovieDetailDb {
  String _title;
  String _year;
  String _rated;
  String _released;
  String _runtime;
  String _genre;
  String _director;
  String _writer;
  String _actors;
  String _plot;
  String _poster;
  String _metascore;
  String _imdbID;

  MovieDetailDb(
      this._title,
      this._year,
      this._rated,
      this._released,
      this._runtime,
      this._genre,
      this._director,
      this._writer,
      this._actors,
      this._plot,
      this._poster,
      this._metascore,
      this._imdbID
      );

  String get title => _title;

  String get rated => _rated;

  String get released => _released;

  String get runtime => _runtime;

  String get genre => _genre;

  String get director => _director;

  String get writer => _writer;

  String get actor => _actors;

  String get plot => _plot;

  String get poster => _poster;

  String get metascore => _metascore;

  String get imdbID => _imdbID;



  // String get imageString => _imageString;


  set title(String newTitle) {
    this._title = newTitle;
  }

  set year(String newYear) {
    this._year = newYear;
  }

  set rated(String newRated) {
    this._rated = newRated;
  }

  set released(String newReleased) {
    this._released = newReleased;
  }

  set runtime(String newRuntime) {
    this._runtime = newRuntime;
  }

  set genre(String newGenre) {
    this._genre = newGenre;
  }

  set director(String newDirector) {
    this._director = newDirector;
  }

  set writer(String newWriter) {
    this._writer = newWriter;
  }

  set actor(String newActor) {
    this._actors = newActor;
  }

  set plot(String newPlot) {
    this._plot = newPlot;
  }

  set poster(String newPoster) {
    this._poster = newPoster;
  }

  set metastore(String newMetascore) {
    this._metascore = newMetascore;
  }

  set imdbID(String newImdbId) {
    this._imdbID = newImdbId;
  }



  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['Title'] = _title;
    map['Year'] = _year;
    map['Rated'] = _rated;
    map['Released'] = _released;
    map['Runtime'] = _runtime;
    map['Genre'] = _genre;
    map['Director'] = _director;
    map['Writer'] = _writer;
    map['Actors'] = _actors;
    map['Plot'] = _plot;
    map['Poster'] = _poster;
    map['Metascore'] = _metascore;
    map['ImdbId'] = _imdbID;

    return map;
  }

  MovieDetailDb.fromMapObject(Map<String, dynamic> map) {
    this._title = map['Title'];
    this._year = map['Year'];
    this._rated = map['Rated'];
    this._released = map['Released'];
    this._runtime =   map['Runtime'];
    this._genre = map['Genre'];
    this._director = map['Director'];
    this._writer = map['Writer'];
    this._actors =  map['Actors'];
    this._plot = map['Plot'];
    this._poster = map['Poster'];
    this._metascore = map['Metascore'];
    this._imdbID = map['ImdbId'];
  }
}