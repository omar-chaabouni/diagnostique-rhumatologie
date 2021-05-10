class Chaq {
  Chaq({
    this.id,
    this.score,
    this.evaluation,
    this.douleurs,
    this.dateDemande,
    this.state,
    this.dateValidation,
    this.dateCalcul,
  });

  String id;
  DateTime dateDemande;
  int state;
  DateTime dateValidation;
  DateTime dateCalcul;
  String score;
  String douleurs;
  String evaluation;

  factory Chaq.fromJson(Map<String, dynamic> json) => Chaq(
        id: json["_id"],
        score: json["score"] == null ? null : json["score"],
        evaluation: json["evaluation"],
        douleurs: json["douleurs"],
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
        "evaluation": evaluation,
        "douleurs": douleurs,
        "dateDemande":
            dateDemande == null ? null : dateDemande.toIso8601String(),
        "state": state,
        "dateValidation":
            dateValidation == null ? null : dateValidation.toIso8601String(),
        "dateCalcul": dateCalcul == null ? null : dateCalcul.toIso8601String(),
      };
}
