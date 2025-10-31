//model de persona, per poder fer objectes Persona, per poder comunicarse entre home_page i personal_page
class Persona {
  String nom;
  String cognom;
  String datNaix;
  String correu;
  String password;

  Persona({
    required this.nom,
    required this.cognom,
    required this.datNaix,
    required this.correu,
    required this.password,
  });

  //aqui utilitzare un copyWith, per poder modificar els atributs de l'objecte sense modificar l'original
  Persona copyWith({
    String? nom,
    String? cognom,
    String? datNaix,
    String? correu,
    String? password,
  }) {
    return Persona(
      nom: nom ?? this.nom,
      cognom: cognom ?? this.cognom,
      datNaix: datNaix ?? this.datNaix,
      correu: correu ?? this.correu,
      password: password ?? this.password,
    );
  }

  //Per tornar el nom complet amb Nom i Cognom
  String get nomComplet => '$nom $cognom';
}
