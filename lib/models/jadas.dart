class Jadas {
  Jadas({
    this.id,
    this.dateDemande,
    this.state,
    this.dateValidation,
  });

  String id;
  DateTime dateDemande;
  int state;
  DateTime dateValidation;

  factory Jadas.fromJson(Map<String, dynamic> json) => Jadas(
        id: json["_id"],
        dateDemande: json["dateDemande"] == null
            ? null
            : DateTime.parse(json["dateDemande"]),
        state: json["state"],
        dateValidation: json["dateValidation"] == null
            ? null
            : DateTime.parse(json["dateValidation"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "dateDemande":
            dateDemande == null ? null : dateDemande.toIso8601String(),
        "state": state,
        "dateValidation":
            dateValidation == null ? null : dateValidation.toIso8601String(),
      };
}
