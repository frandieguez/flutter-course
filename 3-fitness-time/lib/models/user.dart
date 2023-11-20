class User {
  final String name;
  final String avatar;

  double height;
  double weight;
  final String time;
  final double distanceWalked;
  final double activitiesCount;
  final DateTime registeredAt;
  final double profileCompleted;

  User(
      {required this.name,
      required this.avatar,
      required this.height,
      required this.weight,
      required this.time,
      required this.distanceWalked,
      required this.activitiesCount,
      required this.registeredAt,
      required this.profileCompleted});

  setHeight(_height) {
    this.height = _height;
  }

  setWeight(_weight) {
    this.weight = _weight;
  }
}
