import 'dart:convert';

class User {
  String username = '';
  String fullname = '';
  String email = '';
  String password = '';
  String confirmpssword = '';
  String phoneNumber = '';
  User(
      {required this.username,
      required this.fullname,
      required this.email,
      required this.password,
      required this.confirmpssword,
      required this.phoneNumber});
  Map<String, String> tojson() {
    return {
      "username": username,
      "fullname": fullname,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "confirmPassword": confirmpssword
    };
  }
}

SignUp signUpFromJson(String str) => SignUp.fromJson(json.decode(str));

String signUpToJson(SignUp data) => json.encode(data.toJson());

class SignUp {
  SignUp({
    required this.status,
    required this.userDetails,
  });

  final String status;
  final UserDetails userDetails;

  factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
        status: json["status"],
        userDetails: UserDetails.fromJson(json["userDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "userDetails": userDetails.toJson(),
      };
}

class UserDetails {
  UserDetails({
    required this.username,
    required this.fullname,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.confirmPassword,
  });

  final String username;
  final String fullname;
  final String email;
  final String password;
  final String phoneNumber;
  final String confirmPassword;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        username: json["username"],
        fullname: json["fullname"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        confirmPassword: json["confirmPassword"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "fullname": fullname,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "confirmPassword": confirmPassword,
      };
}
