class Character {
  final String name;
  final String imageUrl;
  double totalStars = 0;
  int reviews;
  final int strength;
  final int magic;
  final int speed;
  double get stars => totalStars / reviews;

  Character(
      {required this.name,
      required this.imageUrl,
      required this.totalStars,
      required this.reviews,
      required this.strength,
      required this.magic,
      required this.speed});

  addReview(double review) {
    reviews++;
    totalStars += review;
  }
}
