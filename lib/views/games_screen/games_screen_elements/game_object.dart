class GameObject {
  int id;
  String name;
  String description;
  String imagePath;
  Function gameOnTap;

  GameObject({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.gameOnTap,
  });
}
