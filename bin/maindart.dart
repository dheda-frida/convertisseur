import 'dart:io';

void main() {
  print("=== Convertisseur Romain ↔ Arabe ===");

  print("1. Romain vers Arabe");
  print("2. Arabe vers Romain");
  stdout.write("Choisissez une option (1 ou 2): ");

  String? choix = stdin.readLineSync();

  if (choix == "1") {
    stdout.write("Entrez un chiffre romain: ");
    String? romain = stdin.readLineSync();
    if (romain != null) {
      int resultat = romainVersArabe(romain.toUpperCase());
      print("Résultat: $resultat");
    }
  } else if (choix == "2") {
    stdout.write("Entrez un nombre arabe: ");
    String? input = stdin.readLineSync();
    if (input != null) {
      int nombre = int.parse(input);
      String resultat = arabeVersRomain(nombre);
      print("Résultat: $resultat");
    }
  } else {
    print("Option invalide.");
  }
}

int romainVersArabe(String romain) {
  Map<String, int> valeurs = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000
  };

  int total = 0;

  for (int i = 0; i < romain.length; i++) {
    int valeurActuelle = valeurs[romain[i]]!;
    int valeurSuivante = 0;

    if (i + 1 < romain.length) {
      valeurSuivante = valeurs[romain[i + 1]]!;
    }

    if (valeurActuelle < valeurSuivante) {
      total -= valeurActuelle;
    } else {
      total += valeurActuelle;
    }
  }

  return total;
}

String arabeVersRomain(int nombre) {
  Map<int, String> valeurs = {
    1000: 'M',
    900: 'CM',
    500: 'D',
    400: 'CD',
    100: 'C',
    90: 'XC',
    50: 'L',
    40: 'XL',
    10: 'X',
    9: 'IX',
    5: 'V',
    4: 'IV',
    1: 'I'
  };

  String resultat = "";

  valeurs.forEach((valeur, symbole) {
    while (nombre >= valeur) {
      resultat += symbole;
      nombre -= valeur;
    }
  });

  return resultat;
}

  

    
  


  
