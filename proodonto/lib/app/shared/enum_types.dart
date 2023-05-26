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

enum GeneralType {
  good,
  medium,
  bad;

  static List<String> getNameList() => ["Bom", "Regular", "Ruim"];

  static String getValueByName(GeneralType generalType) {
    const nameList = GeneralType.values;
    int index = nameList.indexOf(generalType);
    return getNameList()[index];
  }
}

enum Surface {
  smooth,
  rough;

  static List<String> getNameList() => ["Lisa", "Rugosa"];

  static String getValueByName(Surface surface) {
    const nameList = Surface.values;
    int index = nameList.indexOf(surface);
    return getNameList()[index];
  }
}

enum Sensibility {
  absent,
  present;

  static List<String> getNameList () => ["Ausênte", "Presente"];

  static String getValueByName(Sensibility sensibility) {
    const nameList = Sensibility.values;
    int index = nameList.indexOf(sensibility);
    return getNameList()[index];
  }
}

enum Asymmetry {
  absent,
  present;

  static List<String> getNameList () => ["Ausênte", "Presente"];

  static String getValueByName(Asymmetry asymmetry) {
    const nameList = Asymmetry.values;
    int index = nameList.indexOf(asymmetry);
    return getNameList()[index];
  }
}

enum Mobility {
  absent,
  present;

  static List<String> getNameList () => ["Ausênte", "Presente"];

  static String getValueByName(Mobility mobility) {
    const nameList = Mobility.values;
    int index = nameList.indexOf(mobility);
    return getNameList()[index];
  }
}

enum Lip {
  skin,
  semiMucous,
  lipCommissure,
  mucous;

  static List<String> getNameList () => ["Pele", "Semi mucosa", "Comissura labial", "Mucosa"];

  static String getValueByName(Lip lip) {
    const nameList = Lip.values;
    int index = nameList.indexOf(lip);
    return getNameList()[index];
  }
}

enum Tongue {
  backFace,
  ventral,
  edges,
  apex;

  static List<String> getNameList () => ["Face dorsal", "Ventral", "Bordas", "Ápice"];

  static String getValueByName(Tongue tongue) {
    const nameList = Tongue.values;
    int index = nameList.indexOf(tongue);
    return getNameList()[index];
  }
}

enum Allergy {
  none,
  respiratoryAllergy,
  skinAllergy,
  insectAllergy,
  medicineAllergy,
  petHairAllergy;

  static List<String> getNameList () => ["Nenhuma", "Alergia respiratória", "Alergia cutânea", "Alergia a insetos", "Alergia a medicamentos", "Alergia a pelo de animais"];

  static String getValueByName(Allergy allergy) {
    const nameList = Allergy.values;
    int index = nameList.indexOf(allergy);
    return getNameList()[index];
  }
}

enum InfectiousDiseases {
  none,
  hepatitis,
  syphilis,
  hiv,
  tuberculosis,
  covid19;

  static List<String> getNameList () => ["Nenhuma", "Hepatite", "Sifilis", "HIV", "Tuberculose", "Covid 19"];

  static String getValueByName(InfectiousDiseases infectiousDiseases) {
    const nameList = InfectiousDiseases.values;
    int index = nameList.indexOf(infectiousDiseases);
    return getNameList()[index];
  }
}

enum FamilyBackground {
  none,
  diabetes,
  highBloodPressure,
  cancer;

  static List<String> getNameList () => ["Nenhuma", "Diabete", "Hipertensão arterial", "cancer"];

  static String getValueByName(FamilyBackground familyBackground) {
    const nameList = FamilyBackground.values;
    int index = nameList.indexOf(familyBackground);
    return getNameList()[index];
  }
}