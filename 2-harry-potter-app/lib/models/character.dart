class Character {
  final int id;
  final String name;
  final String imageUrl;
  double totalStars = 0;
  int reviews;
  final int strength;
  final int magic;
  final int speed;
  double get stars => reviews == 0 ? 0 : totalStars / reviews;
  bool favorite = false;

  Character(
      {required this.id,
      required this.name,
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

  toggleFavorite() {
    favorite = !favorite;
  }
}
