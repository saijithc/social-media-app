class GoogleAccount {
  String email = '';
  String fullname = '';
  String passWord = '';

  GoogleAccount(
      {required this.email, required this.passWord, required this.fullname});
  Map<String, String> toJson() {
    return {"email": email, "fullname": fullname, "password": passWord};
  }
}

class GoogleLogin {
  String email = '';
  String passWord = '';

  GoogleLogin({required this.email, required this.passWord});
  Map<String, String> toJson() {
    return {"email": email, "password": passWord};
  }
}
