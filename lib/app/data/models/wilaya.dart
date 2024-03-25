class Wilaya {
  final String id;
  final String code;
  final String name;
  final String arName;
  final String longitude;
  final String latitude;

  Wilaya({
    required this.id,
    required this.code,
    required this.name,
    required this.arName,
    required this.longitude,
    required this.latitude,
  });

  factory Wilaya.fromJson(Map<String, dynamic> json) {
    return Wilaya(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      arName: json['ar_name'],
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }
}