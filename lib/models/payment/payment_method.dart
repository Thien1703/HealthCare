class PaymentMethod {
  final int id;
  final String name;
  final String? icon;

  PaymentMethod({
    required this.id,
    required this.name,
    this.icon,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
    };
  }
}
