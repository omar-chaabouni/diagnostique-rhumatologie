class Bilan {
  Bilan({
    this.typeBilan,
    this.dateDemande,
    this.state,
  });

  List<dynamic> typeBilan;
  DateTime dateDemande;
  int state;

  factory Bilan.fromJson(Map<String, dynamic> json) => Bilan(
        state: json["state"] == null ? null : json["state"],
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
        "state": state,
      };
}
