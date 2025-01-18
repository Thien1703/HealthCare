class Payment {
  final int id;
  final int appointmentId;
  final double amount;
  final int paymentMethodId;
  final String status;

  Payment({
    required this.id,
    required this.appointmentId,
    required this.amount,
    required this.paymentMethodId,
    required this.status,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      appointmentId: json['appointmentId'],
      amount: json['amount'],
      paymentMethodId: json['paymentMethodId'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'appointmentId': appointmentId,
      'amount': amount,
      'paymentMethodId': paymentMethodId,
      'status': status,
    };
  }
}
