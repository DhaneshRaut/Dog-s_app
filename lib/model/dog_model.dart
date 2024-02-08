// To parse this JSON data, do
//
//     final dog = dogFromJson(jsonString);

import 'dart:convert';
Dog dogFromJson(String str) => Dog.fromJson(json.decode(str));

String dogToJson(Dog data) => json.encode(data.toJson());

class Dog {
    String message;
    String status;
    // String breedName;

    Dog({
        required this.message,
        required this.status,
        // required this.breedName,
    });

    factory Dog.fromJson(Map<String, dynamic> json) => Dog(
        message: json["message"],
        status: json["status"],
        //  imageUrl = json["message"] as String;
        // final breedName = _extractBreedFromUrl(imageUrl);

        // breeds: json["breeds"]
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        // breedName: breedName,


        // static String _extractBreedFromUrl(String imageUrl) {
        // final List<String> parts = imageUrl.split('/');
        // if (parts.length >= 4) {
        //   return parts[4];
        // }
        // return '';
        // }
        // "breeds":breeds,
    };
}
