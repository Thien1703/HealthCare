class Clinic {
  final int id; // ID của phòng khám
  final String name; // Tên phòng khám
  final String address; // Địa chỉ
  final double rating; // Đánh giá trung bình
  final int reviewCount; // Số lượng đánh giá
  final String image; // Đường dẫn hoặc URL hình ảnh
  final String type; // Loại phòng khám
  final String description; // Mô tả phòng khám
  final List<String> specialties; // Danh sách chuyên khoa
  final List<String> notableDoctors; // Danh sách bác sĩ nổi bật
  final String facilities; // Cơ sở vật chất

  // Constructor
  Clinic({
    required this.id,
    required this.name,
    required this.address,
    required this.rating,
    required this.reviewCount,
    required this.image,
    required this.type,
    required this.description,
    required this.specialties,
    required this.notableDoctors,
    required this.facilities,
  });

  // Phương thức khởi tạo từ JSON
  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
      image: json['image'],
      type: json['type'],
      description: json['description'],
      specialties: List<String>.from(json['specialties']),
      notableDoctors: List<String>.from(json['notableDoctors']),
      facilities: json['facilities'],
    );
  }

  // Phương thức chuyển đổi sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'rating': rating,
      'reviewCount': reviewCount,
      'image': image,
      'type': type,
      'description': description,
      'specialties': specialties,
      'notableDoctors': notableDoctors,
      'facilities': facilities,
    };
  }
}
