class Cocktail {
  final String name;
  final String imageUrl;
  final String category;
  final String alcoholic;

  Cocktail({
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.alcoholic,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
      name: json['strDrink'] ?? '',
      imageUrl: json['strDrinkThumb'] ?? '',
      category: json['strCategory'] ?? '',
      alcoholic: json['strAlcoholic'] ?? '',
    );
  }
}
