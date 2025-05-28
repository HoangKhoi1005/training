part of my_domain;

enum MissionStatus {
  disponible,
  enCours,
  expiree,
}

extension MissionStatusExtension on MissionStatus {
  String get lable {
    switch (this) {
      case MissionStatus.disponible:
        return 'Disponible';
      case MissionStatus.enCours:
        return 'En cours';
      case MissionStatus.expiree:
        return 'Expirée';
    }
  }
}
