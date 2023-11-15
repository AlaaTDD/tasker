class UserData
{

  String? name;
  String? email;
  String? phone;


  UserData({
    required this.name,  required this.email, required this.phone,

  });

  UserData.fromJson(Map<String,dynamic>json)
  {
    email=json["email"];
    name=json["name"];
    phone=json["phone"];


  }
  Map<String,dynamic>toMap()
  {
    return {
      "name":name,
      "email":email,
      "phone":phone,

    };
  }

}

