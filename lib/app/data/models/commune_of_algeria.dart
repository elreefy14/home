class Commune {
  final String id;
  final String postCode;
  final String name;
  final String wilayaId;
  final String arName;
  final String longitude;
  final String latitude;

  Commune({
    required this.id,
    required this.postCode,
    required this.name,
    required this.wilayaId,
    required this.arName,
    required this.longitude,
    required this.latitude,
  });

  factory Commune.fromJson(Map<String, dynamic> json) {
    return Commune(
      id: json['id'],
      postCode: json['post_code'],
      name: json['name'],
      wilayaId: json['wilaya_id'],
      arName: json['ar_name'],
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }
}