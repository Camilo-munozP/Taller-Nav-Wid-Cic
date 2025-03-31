class ChuckNorrisJoke {
  final String id;
  final String joke;
  final String iconUrl;

  ChuckNorrisJoke({
    required this.id,
    required this.joke,
    required this.iconUrl,
  });

  factory ChuckNorrisJoke.fromJson(Map<String, dynamic> json) {
    return ChuckNorrisJoke(
      id: json['id'],
      joke: json['value'],
      iconUrl: json['icon_url'],
    );
  }
}
