class Shloka {
  String verse;
  String san;
  String guj;
  String eng;
  String hin;

  Shloka({
    required this.verse,
    required this.san,
    required this.guj,
    required this.eng,
    required this.hin,
  });

  factory Shloka.fromMap({required Map data}) {
    return Shloka(
      verse: data['verse'],
      eng: data['eng'],
      san: data['san'],
      guj: data['guj'],
      hin: data['hin'],
    );
  }
}

class HanumanChalisa {
  String san;
  String guj;
  String eng;

  HanumanChalisa({
    required this.san,
    required this.guj,
    required this.eng,
  });

  factory HanumanChalisa.fromMap({required Map data}) {
    return HanumanChalisa(
      san: data['san'],
      guj: data['guj'],
      eng: data['eng'],
    );
  }
}

class RaanName {
  String san;

  RaanName({
    required this.san,
  });

  factory RaanName.fromMap({required Map data}) {
    return RaanName(
      san: data['san'],
    );
  }
}
