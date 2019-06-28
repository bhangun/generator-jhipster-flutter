class UserProfile {
    final String id;
    final String name;
    
    const UserProfile ({ 
        this.id,
        this.name, 
    });

    factory UserProfile.fromJson(Map<String, dynamic> json) =>  UserProfile(
        id: json['id'],
        name: json['name'],
    );

    Map<String, dynamic> toJson() => {
        "id": id, 
        "name": name, 
    };
}