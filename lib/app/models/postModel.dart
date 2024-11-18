// models/post_model.dart

class PostModel {
  final String idTeam;
  final String strTeam;
  final String strStadium;
  final String strBadge;

  PostModel(
      {required this.idTeam,required this.strTeam,required this.strStadium,required this.strBadge});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        idTeam: json["idTeam"],
        strTeam: json["strTeam"],
        strStadium: json["strStadium"],
        strBadge: json["strBadge"]);}
}
