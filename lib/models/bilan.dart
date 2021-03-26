class Bilan {
  Bilan({
    this.id,
    this.typeBilan,
    this.dateDemande,
    this.state,
    this.dateValidation,
  });

  String id;
  String typeBilan;
  DateTime dateDemande;
  int state;
  DateTime dateValidation;

  factory Bilan.fromJson(Map<String, dynamic> json) => Bilan(
        id: json["_id"],
        typeBilan: json["type_bilan"] == null ? null : json["type_bilan"],
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
        "type_bilan": typeBilan == null ? null : typeBilan,
        "dateDemande":
            dateDemande == null ? null : dateDemande.toIso8601String(),
        "state": state,
        "dateValidation":
            dateValidation == null ? null : dateValidation.toIso8601String(),
      };
}
