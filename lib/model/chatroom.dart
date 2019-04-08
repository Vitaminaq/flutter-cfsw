// To parse this JSON data, do
//
//     final response = responseFromJson(jsonString);

import 'dart:convert';

Response responseFromJson(String str) {
    final jsonData = json.decode(str);
    return Response.fromJson(jsonData);
}

String responseToJson(Response data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Response {
    String greeting;
    List<String> instructions;

    Response({
        this.greeting,
        this.instructions,
    });

    factory Response.fromJson(Map<String, dynamic> json) => new Response(
        greeting: json["greeting"] == null ? null : json["greeting"],
        instructions: json["instructions"] == null ? null : new List<String>.from(json["instructions"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "greeting": greeting == null ? null : greeting,
        "instructions": instructions == null ? null : new List<dynamic>.from(instructions.map((x) => x)),
    };
}
