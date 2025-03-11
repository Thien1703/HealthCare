class Appointment {
  final int id;
  final int clinicId;
  final int customerId;
  final String date;
  final String time;
  final String status;
  final int? paymentId;

  Appointment({
    required this.id,
    required this.clinicId,
    required this.customerId,
    required this.date,
    required this.time,
    required this.status,
    required this.paymentId,
  });

  // Chuyển đổi từ JSON sang Model
  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      clinicId: json['clinicId'],
      customerId: json['customerId'],
      date: json['date'],
      time: json['time'],
      status: json['status'],
      paymentId: json['paymentId'],
    );
  }

  // Chuyển đổi từ Model sang JSON
  Map<String, dynamic> toJson() {
    return {
      'clinicId': clinicId,
      'customerId': customerId,
      'date': date,
      'time': time,
      'paymentId': paymentId,
    };
  }
}
