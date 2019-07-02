import 'dart:convert';

UserResponse userResponseFromJson(String str) {
  return new UserResponse.fromJson(json.decode(str));
} 

String userResponseToJson(Results data) => json.encode(data.toJson());

class UserResponse {
    List<Results> results;
    Info info;

    UserResponse({
        this.results,
        this.info,
    });

    factory UserResponse.fromJson(Map<String, dynamic> json) => new UserResponse(
        results: new List<Results>.from(json["results"].map((x) => Results.fromJson(x))),
        // info: Info.fromJson(json["info"]),
    );

    Map<String, dynamic> toJson() => {
        "results": new List<dynamic>.from(results.map((x) => x.toJson())),
        "info": info.toJson(),
    };
}

class Info {
    String seed;
    int results;
    int page;
    String version;

    Info({
        this.seed,
        this.results,
        this.page,
        this.version,
    });

    factory Info.fromJson(Map<String, dynamic> json) => new Info(
        seed: json["seed"],
        results: json["results"],
        page: json["page"],
        version: json["version"],
    );

    Map<String, dynamic> toJson() => {
        "seed": seed,
        "results": results,
        "page": page,
        "version": version,
    };
}

class Results {
    String gender;
    Name name;
    Location location;
    String email;
    Login login;
    Dob dob;
    Dob registered;
    String phone;
    String cell;
    Id id;
    Picture picture;
    String nat;

    Results({
        this.gender,
        this.name,
        this.location,
        this.email,
        this.login,
        this.dob,
        this.registered,
        this.phone,
        this.cell,
        this.id,
        this.picture,
        this.nat,
    });

    factory Results.fromJson(Map<String, dynamic> json) => new Results(
        gender: json["gender"],
        name: Name.fromJson(json["name"]),
        location: Location.fromJson(json["location"]),
        email: json["email"],
        dob: Dob.fromJson(json["dob"]),
        phone: json["phone"],
        cell: json["cell"],
        picture: Picture.fromJson(json["picture"]),
        nat: json["nat"]
    );

    Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name.toJson(),
        "location": location.toJson(),
        "email": email,
        "login": login.toJson(),
        "dob": dob.toJson(),
        "phone": phone,
        "cell": cell,
        "picture": picture.toJson(),
        "nat": nat,
    };
}

class Dob {
    DateTime date;
    int age;

    Dob({
        this.date,
        this.age,
    });

    factory Dob.fromJson(Map<String, dynamic> json) => new Dob(
        date: DateTime.parse(json["date"]),
        age: json["age"],
    );

    Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "age": age,
    };
}

class Id {
    String name;
    String value;

    Id({
        this.name,
        this.value,
    });

    factory Id.fromJson(Map<String, dynamic> json) => new Id(
        name: json["name"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
    };
}

class Location {
    String street;
    String city;
    String state;
    dynamic postcode;
    Coordinates coordinates;
    Timezone timezone;

    Location({
        this.street,
        this.city,
        this.state,
        this.postcode,
        this.coordinates,
        this.timezone,
    });

    factory Location.fromJson(Map<String, dynamic> json) => new Location(
        street: json["street"],
        city: json["city"],
        state: json["state"],
        postcode: json["postcode"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
        timezone: Timezone.fromJson(json["timezone"]),
    );

    Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "state": state,
        "postcode": postcode,
        "coordinates": coordinates.toJson(),
        "timezone": timezone.toJson(),
    };
}

class Coordinates {
    String latitude;
    String longitude;

    Coordinates({
        this.latitude,
        this.longitude,
    });

    factory Coordinates.fromJson(Map<String, dynamic> json) => new Coordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}

class Timezone {
    String offset;
    String description;

    Timezone({
        this.offset,
        this.description,
    });

    factory Timezone.fromJson(Map<String, dynamic> json) => new Timezone(
        offset: json["offset"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "offset": offset,
        "description": description,
    };
}

class Login {
    String uuid;
    String username;
    String password;
    String salt;
    String md5;
    String sha1;
    String sha256;

    Login({
        this.uuid,
        this.username,
        this.password,
        this.salt,
        this.md5,
        this.sha1,
        this.sha256,
    });

    factory Login.fromJson(Map<String, dynamic> json) => new Login(
        uuid: json["uuid"],
        username: json["username"],
        password: json["password"],
        salt: json["salt"],
        md5: json["md5"],
        sha1: json["sha1"],
        sha256: json["sha256"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "username": username,
        "password": password,
        "salt": salt,
        "md5": md5,
        "sha1": sha1,
        "sha256": sha256,
    };
}

class Name {
    String title;
    String first;
    String last;

    Name({
        this.title,
        this.first,
        this.last,
    });

    factory Name.fromJson(Map<String, dynamic> json) => new Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
    };
}

class Picture {
    String large;
    String medium;
    String thumbnail;

    Picture({
        this.large,
        this.medium,
        this.thumbnail,
    });

    factory Picture.fromJson(Map<String, dynamic> json) => new Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
    };
}
