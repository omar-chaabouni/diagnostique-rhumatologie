// import 'dart:convert';
// class Bilan {
//   // factory Bilan.fromRawJson(String str) => Bilan.fromJson(json.decode(str));

//   // String toRawJson() => json.encode(toJson());

//   Bilan({
//     // this.id,
//     this.typeBilan,
//     this.dateDemande,
//     this.state,
//   });

//   // String id;
//   List<String> typeBilan;
//   DateTime dateDemande;
//   int state;

//   factory Bilan.fromJson(Map<String, dynamic> json) => Bilan(
//         // id: json["_id"],
//         typeBilan: json["type_bilan"] == null ? null : json["type_bilan"],
//         dateDemande: json["dateDemande"] == null
//             ? null
//             : DateTime.parse(json["dateDemande"]),
//         state: json["state"] == null ? null : json["state"],
//       );

//   Map<String, dynamic> toJson() => {
//         // "_id": id,
//         "type_bilan": typeBilan == null ? null : typeBilan,
//         "dateDemande":
//             dateDemande == null ? null : dateDemande.toIso8601String(),
//         "state": state == null ? null : state,
//       };
// }
class Bilan {
  Bilan({
    this.typeBilan,
    this.dateDemande,
  });

  List<dynamic> typeBilan;
  DateTime dateDemande;

  factory Bilan.fromJson(Map<String, dynamic> json) => Bilan(
        typeBilan: json["type_bilan"] == null
            ? null
            : List<dynamic>.from(json["type_bilan"].map((x) => x)),
        dateDemande: json["dateDemande"] == null
            ? null
            : DateTime.parse(json["dateDemande"]),
      );

  Map<String, dynamic> toJson() => {
        "type_bilan": List<dynamic>.from(typeBilan.map((x) => x)),
        "dateDemande": dateDemande.toIso8601String(),
      };
}
