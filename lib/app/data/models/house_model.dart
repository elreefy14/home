class HouseModel {
  final String distance;
  final String name;
  final String location;
  final double price;
  final int numberOfRooms; // Add this
  final int numberOfBathrooms; // Add this
  final String description;
  final String ownerName;
  final String ownerNumber;
  final List<String> images;
  //String ownerImageUrl;
  final String ownerImageUrl = 'assets/images/person1.png';


  HouseModel({
    required this.distance,
    required this.name,
    required this.location,
    required this.price,
    required this.numberOfRooms, // Add this
    required this.numberOfBathrooms, // Add this
    required this.description,
    required this.ownerName,
    required this.ownerNumber,
    required this.images,
    // required this.ownerImageUrl,
  });

}