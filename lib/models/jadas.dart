class Jadas {
  Jadas({
    this.id,
    this.dateDemande,
    this.state,
    this.dateValidation,
    this.dateCalcul,
    this.score,
  });

  String id;
  DateTime dateDemande;
  int state;
  DateTime dateValidation;
  DateTime dateCalcul;
  String score;

  factory Jadas.fromJson(Map<String, dynamic> json) => Jadas(
        id: json["_id"],
        score: json["score"],
        dateDemande: json["dateDemande"] == null
            ? null
            : DateTime.parse(json["dateDemande"]),
        state: json["state"],
        dateValidation: json["dateValidation"] == null
            ? null
            : DateTime.parse(json["dateValidation"]),
        dateCalcul: json["dateCalcul"] == null
            ? null
            : DateTime.parse(json["dateCalcul"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "score": score,
        "dateDemande":
            dateDemande == null ? null : dateDemande.toIso8601String(),
        "state": state,
        "dateValidation":
            dateValidation == null ? null : dateValidation.toIso8601String(),
        "dateCalcul": dateCalcul == null ? null : dateCalcul.toIso8601String(),
      };
}
