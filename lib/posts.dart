class Posts {
    int id;
    String name;
    String username;
    String email;
   
    String phone;
    String website;
    

    Posts({
        required this.id,
        required this.name,
        required this.username,
        required this.email,
       
        required this.phone,
        required this.website,
        
    });

    factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
      
        phone: json["phone"],
        website: json["website"],
       
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
       
        "phone": phone,
        "website": website,
       
    };
  //   static  userDetailsFromJson(List<dynamic> userDe) {
  //   return userDe.map((e) => Users.fromJson(e)).toList();
  // }
}
