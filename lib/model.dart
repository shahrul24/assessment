class Vehicle {
  final int? id;
  final String? reg_no;
  final String? model;
  final String? created_at;
  final String? updated_at;

  const Vehicle({
    required this.id,
    required this.reg_no,
    required this.model,
    required this.created_at,
    required this.updated_at,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'],
      reg_no: json['reg_no'],
      model: json['model'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
