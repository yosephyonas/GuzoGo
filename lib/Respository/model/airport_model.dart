class Airport {
  final String code;
  final String name;
  final double latitude;
  final double longitude;
  final String country;

  Airport({
    required this.code,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.country,
  });

  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      code: json['code'],
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      country: json['country'],
    );
  }
}
