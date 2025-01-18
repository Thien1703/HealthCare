class Appointment {
  final int id;
  final int userId;
  final int hospitalId;
  final int serviceId;
  final DateTime date;
  final String time;
  final String status;

  Appointment({
    required this.id,
    required this.userId,
    required this.hospitalId,
    required this.serviceId,
    required this.date,
    required this.time,
    required this.status,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      userId: json['userId'],
      hospitalId: json['hospitalId'],
      serviceId: json['serviceId'],
      date: DateTime.parse(json['date']),
      time: json['time'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'hospitalId': hospitalId,
      'serviceId': serviceId,
      'date': date.toIso8601String(),
      'time': time,
      'status': status,
    };
  }
}
