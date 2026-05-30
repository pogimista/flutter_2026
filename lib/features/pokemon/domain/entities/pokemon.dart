class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final int height;
  final int weight;
  final Map<String, int> stats;

  const Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.height,
    required this.weight,
    required this.stats,
  });

  String get formattedId => '#${id.toString().padLeft(3, '0')}';
  String get formattedHeight => '${(height / 10).toStringAsFixed(1)} m';
  String get formattedWeight => '${(weight / 10).toStringAsFixed(1)} kg';
}
