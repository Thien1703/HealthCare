import 'dart:convert';

class Clinic {
  final int id;
  final String name;
  final String image;
  final String description;
  final double? rating;
  final int? reviewCount;
  final String address;
  final String facilitie;
  final double latitude;
  final double longitude;

  Clinic({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    this.rating,
    this.reviewCount,
    required this.address,
    required this.facilitie,
    required this.latitude,
    required this.longitude,
  });

  // Chuyển từ JSON sang Object
  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      id: json['id'],
      name: utf8.decode(json['name'].toString().codeUnits), // Sửa lỗi
      image: json['image'] ?? '',
      description:
          utf8.decode(json['description'].toString().codeUnits), // Sửa lỗi
      rating:
          json['rating'] != null ? (json['rating'] as num).toDouble() : null,
      reviewCount: json['reviewCount'],
      address: utf8.decode(json['address'].toString().codeUnits), // Sửa lỗi
      facilitie: utf8.decode(json['facilitie'].toString().codeUnits), // Sửa lỗi
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }

  // Chuyển từ Object sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'rating': rating,
      'reviewCount': reviewCount,
      'address': address,
      'facilitie': facilitie,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
