class Jadas {
  Jadas({
    this.id,
    this.dateDemande,
    this.state,
    this.dateValidation,
    this.dateRempli,
  });

  String id;
  DateTime dateDemande;
  int state;
  DateTime dateValidation;
  DateTime dateRempli;

  factory Jadas.fromJson(Map<String, dynamic> json) => Jadas(
        id: json["_id"],
        dateDemande: json["dateDemande"] == null
            ? null
            : DateTime.parse(json["dateDemande"]),
        state: json["state"],
        dateValidation: json["dateValidation"] == null
            ? null
            : DateTime.parse(json["dateValidation"]),
        dateRempli: json["dateRempli"] == null
            ? null
            : DateTime.parse(json["dateRempli"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "dateDemande":
            dateDemande == null ? null : dateDemande.toIso8601String(),
        "state": state,
        "dateValidation":
            dateValidation == null ? null : dateValidation.toIso8601String(),
        "dateRempli": dateRempli == null ? null : dateRempli.toIso8601String(),
      };
}
