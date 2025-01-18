class Service {
  final int id;
  final String name;
  final double price;
  final String? description;

  Service({
    required this.id,
    required this.name,
    required this.price,
    this.description,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
    };
  }
}
