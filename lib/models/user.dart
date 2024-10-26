class User {
  final String email;
  final String password;
  final String phoneNumber;
  final String name;
  final String guidAplication;
  final String role;
  final String companyGuid;

  User(
      {required this.email,
      required this.password,
      required this.phoneNumber,
      required this.name,
      required this.guidAplication,
      required this.role,
      required this.companyGuid});

  // Konversi atribut model dari data json
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      name: json['name'],
      guidAplication: json['guidAplication'],
      role: json['role'],
      companyGuid: json['companyGuid'],
    );
  }

  // Konversi atribut model menjadi data json
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'name': name,
      'guidAplication': guidAplication,
      'role': role,
      'companyGuid': companyGuid,
    };
  }
}
