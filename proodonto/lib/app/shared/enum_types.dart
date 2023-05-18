enum SkinColor {
  branca,
  parda,
  morena_clara,
  morena_moderada,
  morena_escura;

  static List<String> getNameList() =>
      ["Branca", "Parda", "Morena clara", "Morena moderada", "Morena escura"];

  static String getValueByName(SkinColor skinColor) {
    const nameList = SkinColor.values;
    int index = nameList.indexOf(skinColor);
    return getNameList()[index];
  }
}

enum MaritalStatus {
  solteiro,
  casado,
  separado,
  divorciado,
  viuvo,
  uniao_estavel;

  static List<String> getNameList() => [
        "Solteiro(a)",
        "Casado(a)",
        "Separado(a)",
        "Divorciado(a)",
        "Viúvo(a)",
        "União estável"
      ];

  static String getValueByName(MaritalStatus maritalStatus) {
    const nameList = MaritalStatus.values;
    int index = nameList.indexOf(maritalStatus);
    return getNameList()[index];
  }
}

enum Sex {
  Male,
  Female,
  Other;

  static List<String> getNameList() => ["Masculino", "Feminino", "Outro"];

  static String getValueByName(Sex sex) {
    const nameList = Sex.values;
    int index = nameList.indexOf(sex);
    return getNameList()[index];
  }
}
