class MovieList {
  List<Search> search;
  String totalResults;
  String response;

  MovieList({
    this.search,
    this.totalResults,
    this.response,
  });

  MovieList.fromJson(Map<String, dynamic> json) {
    search = (json['Search'] as List).map((dynamic e) => Search.fromMap(e as Map<String,dynamic>)).toList();
    totalResults = json['totalResults'] as String;
    response = json['Response'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['Search'] = search?.map((e) => e.toJson()).toList();
    json['totalResults'] = totalResults;
    json['Response'] = response;
    return json;
  }
}

class Search {
  String title;
  String year;
  String imdbID;
  String type;
  String poster;

  Search({
    this.title,
    this.year,
    this.imdbID,
    this.type,
    this.poster,
  });

  Search.fromMap(Map<String, dynamic> json) {
    title = json['Title'] as String;
    year = json['Year'] as String;
    imdbID = json['imdbID'] as String;
    type = json['Type'] as String;
    poster = json['Poster'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['Title'] = title;
    json['Year'] = year;
    json['imdbID'] = imdbID;
    json['Type'] = type;
    json['Poster'] = poster;
    return json;
  }
}