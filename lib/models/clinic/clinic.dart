class Clinic {
  final int id;
  final String name;
  final String image;
  final String description;
  final double rating;
  final int reviewCount;
  final String address;
  final String facilities;
  final double latitude;
  final double longitude;
  

  Clinic({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.rating,
    required this.reviewCount,
    required this.address,
    required this.facilities,
    required this.latitude,
    required this.longitude,
   
  });

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      rating: json['rating'],
      reviewCount: json['reviewCount'],
      address: json['address'],
      facilities: json['facilitie'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      
    );
  }
}
