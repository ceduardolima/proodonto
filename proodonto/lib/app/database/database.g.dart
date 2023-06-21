// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorProodontoDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ProodontoDatabaseBuilder databaseBuilder(String name) =>
      _$ProodontoDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ProodontoDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$ProodontoDatabaseBuilder(null);
}

class _$ProodontoDatabaseBuilder {
  _$ProodontoDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$ProodontoDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$ProodontoDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<ProodontoDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$ProodontoDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$ProodontoDatabase extends ProodontoDatabase {
  _$ProodontoDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PatientDao? _patientDaoInstance;

  TriageDao? _triageDaoInstance;

  ExamDao? _examDaoInstance;

  AnamnesisDao? _anamnesisDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `patient` (`recordNumber` INTEGER, `advisor` TEXT, `semester` TEXT, `careUnit` TEXT, `profession` TEXT, `workAddress` TEXT, `email` TEXT, `initialExam` TEXT, `responsibleName` TEXT, `responsibleAddress` TEXT, `responsibleRG` TEXT, `responsibleIssuingAgency` TEXT, `parentalRelationship` TEXT, `responsiblePhoneNumber` TEXT, `id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `birthday` TEXT, `sex` INTEGER, `cpf` TEXT, `rg` TEXT, `issuingAgency` TEXT, `cep` TEXT, `address` TEXT, `neighborhood` TEXT, `addressComplement` TEXT, `skinColor` INTEGER, `fixNumber` TEXT, `phone` TEXT, `placeOfBirth` TEXT, `nationality` TEXT, `maritalStatus` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `triage` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `patientCPF` TEXT, `operatorCPF` TEXT, `operatorName` TEXT, `patientName` TEXT, `recordNumber` INTEGER, `reasonForConsultation` TEXT, `hasCovid` INTEGER, `hasCough` INTEGER, `testType` TEXT, `kinship` TEXT, `hasFever` INTEGER, `hasDifficultyToBreathing` INTEGER, `hasTiredness` INTEGER, `hasLossOfSmell` INTEGER, `hasLossOfTaste` INTEGER, `hasSoreThroat` INTEGER, `hasHeadache` INTEGER, `hasDiarrhea` INTEGER, `oximetry` TEXT, `heartRate` TEXT, `temperature` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `exam` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `patientCPF` TEXT, `generalType` INTEGER, `weight` TEXT, `height` TEXT, `temperature` TEXT, `bloodPressure` TEXT, `pulsation` TEXT, `oximetry` TEXT, `othersObservations` TEXT, `skinColor` INTEGER, `skinColoring` TEXT, `consistency` TEXT, `skinTexture` TEXT, `eyeColor` TEXT, `hairColor` TEXT, `asymmetryType` INTEGER, `surfaceType` INTEGER, `mobilityType` INTEGER, `sensibilityType` INTEGER, `lipsType` INTEGER, `tongueType` INTEGER, `buccalMucosa` TEXT, `gum` TEXT, `alveolarRidge` TEXT, `retromolarTrigone` TEXT, `mouthFloor` TEXT, `palateModel` TEXT, `tonsilPillars` TEXT, `variationNormality` TEXT, `whichVariations` TEXT, `injuryPresence` TEXT, `injuryDescription` TEXT, `complementaryExams` TEXT, `examResult` TEXT, `definitiveDiagnosis` TEXT, `conduct` TEXT, `diagnosticHypothesis` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `anamnesis` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `patientCPF` TEXT, `complain` TEXT, `diseaseHistory` TEXT, `diseases` TEXT, `currentTreatment` TEXT, `forWhat` TEXT, `pregnancy` TEXT, `howManyMonth` TEXT, `prenatalExam` INTEGER, `medicalRecommendations` TEXT, `useMedicine` TEXT, `whichMedicines` TEXT, `doctorName` TEXT, `allergy` INTEGER, `surgery` TEXT, `hasHealingProblem` INTEGER, `healingProblemSituation` TEXT, `hasProblemWithAnesthesia` INTEGER, `problemWithAnesthesiaSituation` TEXT, `hasBleedingProblem` INTEGER, `bleedingProblemSituation` TEXT, `hasRheumaticFever` INTEGER, `hasKidneyProblem` INTEGER, `hasRespiratoryProblem` INTEGER, `hasJointProblem` INTEGER, `hasHighBloodPressureProblem` INTEGER, `hasHeartProblem` INTEGER, `hasGastricProblem` INTEGER, `hasAnemia` INTEGER, `hasDiabetes` INTEGER, `hasNeurologicalProblems` INTEGER, `infectiousDiseases` INTEGER, `underwentChemotherapy` INTEGER, `hasOnychophagy` INTEGER, `hasMouthPiece` INTEGER, `hasBruxism` INTEGER, `isSmoker` INTEGER, `cigaretteType` TEXT, `isAlcoholic` INTEGER, `drinkType` TEXT, `otherHabits` TEXT, `familyBackground` INTEGER, `hasAnxiety` TEXT, `dentalTreatment` TEXT, `lastVisitToTheDentist` TEXT, `negativeExperience` TEXT, `whatKindOfTreatment` TEXT, `brushNumber` TEXT, `brushType` TEXT, `useDentalFloss` INTEGER, `hasDryMouthFeeling` INTEGER, `feelBurning` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PatientDao get patientDao {
    return _patientDaoInstance ??= _$PatientDao(database, changeListener);
  }

  @override
  TriageDao get triageDao {
    return _triageDaoInstance ??= _$TriageDao(database, changeListener);
  }

  @override
  ExamDao get examDao {
    return _examDaoInstance ??= _$ExamDao(database, changeListener);
  }

  @override
  AnamnesisDao get anamnesisDao {
    return _anamnesisDaoInstance ??= _$AnamnesisDao(database, changeListener);
  }
}

class _$PatientDao extends PatientDao {
  _$PatientDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _patientInsertionAdapter = InsertionAdapter(
            database,
            'patient',
            (Patient item) => <String, Object?>{
                  'recordNumber': item.recordNumber,
                  'advisor': item.advisor,
                  'semester': item.semester,
                  'careUnit': item.careUnit,
                  'profession': item.profession,
                  'workAddress': item.workAddress,
                  'email': item.email,
                  'initialExam': item.initialExam,
                  'responsibleName': item.responsibleName,
                  'responsibleAddress': item.responsibleAddress,
                  'responsibleRG': item.responsibleRG,
                  'responsibleIssuingAgency': item.responsibleIssuingAgency,
                  'parentalRelationship': item.parentalRelationship,
                  'responsiblePhoneNumber': item.responsiblePhoneNumber,
                  'id': item.id,
                  'name': item.name,
                  'birthday': item.birthday,
                  'sex': item.sex?.index,
                  'cpf': item.cpf,
                  'rg': item.rg,
                  'issuingAgency': item.issuingAgency,
                  'cep': item.cep,
                  'address': item.address,
                  'neighborhood': item.neighborhood,
                  'addressComplement': item.addressComplement,
                  'skinColor': item.skinColor?.index,
                  'fixNumber': item.fixNumber,
                  'phone': item.phone,
                  'placeOfBirth': item.placeOfBirth,
                  'nationality': item.nationality,
                  'maritalStatus': item.maritalStatus?.index
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Patient> _patientInsertionAdapter;

  @override
  Future<List<Patient>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM patient',
        mapper: (Map<String, Object?> row) => Patient(
            recordNumber: row['recordNumber'] as int?,
            advisor: row['advisor'] as String?,
            semester: row['semester'] as String?,
            careUnit: row['careUnit'] as String?,
            profession: row['profession'] as String?,
            workAddress: row['workAddress'] as String?,
            email: row['email'] as String?,
            initialExam: row['initialExam'] as String?,
            responsibleName: row['responsibleName'] as String?,
            responsibleAddress: row['responsibleAddress'] as String?,
            responsibleRG: row['responsibleRG'] as String?,
            responsibleIssuingAgency:
                row['responsibleIssuingAgency'] as String?,
            parentalRelationship: row['parentalRelationship'] as String?,
            responsiblePhoneNumber: row['responsiblePhoneNumber'] as String?,
            id: row['id'] as int?,
            name: row['name'] as String?,
            birthday: row['birthday'] as String?,
            sex: row['sex'] == null ? null : Sex.values[row['sex'] as int],
            cpf: row['cpf'] as String?,
            rg: row['rg'] as String?,
            issuingAgency: row['issuingAgency'] as String?,
            cep: row['cep'] as String?,
            address: row['address'] as String?,
            neighborhood: row['neighborhood'] as String?,
            addressComplement: row['addressComplement'] as String?,
            skinColor: row['skinColor'] == null
                ? null
                : SkinColor.values[row['skinColor'] as int],
            fixNumber: row['fixNumber'] as String?,
            phone: row['phone'] as String?,
            placeOfBirth: row['placeOfBirth'] as String?,
            nationality: row['nationality'] as String?,
            maritalStatus: row['maritalStatus'] == null
                ? null
                : MaritalStatus.values[row['maritalStatus'] as int]));
  }

  @override
  Stream<Patient?> findById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM patient WHERE id=?1',
        mapper: (Map<String, Object?> row) => Patient(
            recordNumber: row['recordNumber'] as int?,
            advisor: row['advisor'] as String?,
            semester: row['semester'] as String?,
            careUnit: row['careUnit'] as String?,
            profession: row['profession'] as String?,
            workAddress: row['workAddress'] as String?,
            email: row['email'] as String?,
            initialExam: row['initialExam'] as String?,
            responsibleName: row['responsibleName'] as String?,
            responsibleAddress: row['responsibleAddress'] as String?,
            responsibleRG: row['responsibleRG'] as String?,
            responsibleIssuingAgency:
                row['responsibleIssuingAgency'] as String?,
            parentalRelationship: row['parentalRelationship'] as String?,
            responsiblePhoneNumber: row['responsiblePhoneNumber'] as String?,
            id: row['id'] as int?,
            name: row['name'] as String?,
            birthday: row['birthday'] as String?,
            sex: row['sex'] == null ? null : Sex.values[row['sex'] as int],
            cpf: row['cpf'] as String?,
            rg: row['rg'] as String?,
            issuingAgency: row['issuingAgency'] as String?,
            cep: row['cep'] as String?,
            address: row['address'] as String?,
            neighborhood: row['neighborhood'] as String?,
            addressComplement: row['addressComplement'] as String?,
            skinColor: row['skinColor'] == null
                ? null
                : SkinColor.values[row['skinColor'] as int],
            fixNumber: row['fixNumber'] as String?,
            phone: row['phone'] as String?,
            placeOfBirth: row['placeOfBirth'] as String?,
            nationality: row['nationality'] as String?,
            maritalStatus: row['maritalStatus'] == null
                ? null
                : MaritalStatus.values[row['maritalStatus'] as int]),
        arguments: [id],
        queryableName: 'patient',
        isView: false);
  }

  @override
  Stream<Patient?> findByCPF(String cpf) {
    return _queryAdapter.queryStream('SELECT * FROM patient WHERE cpf=?1',
        mapper: (Map<String, Object?> row) => Patient(
            recordNumber: row['recordNumber'] as int?,
            advisor: row['advisor'] as String?,
            semester: row['semester'] as String?,
            careUnit: row['careUnit'] as String?,
            profession: row['profession'] as String?,
            workAddress: row['workAddress'] as String?,
            email: row['email'] as String?,
            initialExam: row['initialExam'] as String?,
            responsibleName: row['responsibleName'] as String?,
            responsibleAddress: row['responsibleAddress'] as String?,
            responsibleRG: row['responsibleRG'] as String?,
            responsibleIssuingAgency:
                row['responsibleIssuingAgency'] as String?,
            parentalRelationship: row['parentalRelationship'] as String?,
            responsiblePhoneNumber: row['responsiblePhoneNumber'] as String?,
            id: row['id'] as int?,
            name: row['name'] as String?,
            birthday: row['birthday'] as String?,
            sex: row['sex'] == null ? null : Sex.values[row['sex'] as int],
            cpf: row['cpf'] as String?,
            rg: row['rg'] as String?,
            issuingAgency: row['issuingAgency'] as String?,
            cep: row['cep'] as String?,
            address: row['address'] as String?,
            neighborhood: row['neighborhood'] as String?,
            addressComplement: row['addressComplement'] as String?,
            skinColor: row['skinColor'] == null
                ? null
                : SkinColor.values[row['skinColor'] as int],
            fixNumber: row['fixNumber'] as String?,
            phone: row['phone'] as String?,
            placeOfBirth: row['placeOfBirth'] as String?,
            nationality: row['nationality'] as String?,
            maritalStatus: row['maritalStatus'] == null
                ? null
                : MaritalStatus.values[row['maritalStatus'] as int]),
        arguments: [cpf],
        queryableName: 'patient',
        isView: false);
  }

  @override
  Stream<List<Patient>?> findByName(String name) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM patient WHERE name like ?1',
        mapper: (Map<String, Object?> row) => Patient(
            recordNumber: row['recordNumber'] as int?,
            advisor: row['advisor'] as String?,
            semester: row['semester'] as String?,
            careUnit: row['careUnit'] as String?,
            profession: row['profession'] as String?,
            workAddress: row['workAddress'] as String?,
            email: row['email'] as String?,
            initialExam: row['initialExam'] as String?,
            responsibleName: row['responsibleName'] as String?,
            responsibleAddress: row['responsibleAddress'] as String?,
            responsibleRG: row['responsibleRG'] as String?,
            responsibleIssuingAgency:
                row['responsibleIssuingAgency'] as String?,
            parentalRelationship: row['parentalRelationship'] as String?,
            responsiblePhoneNumber: row['responsiblePhoneNumber'] as String?,
            id: row['id'] as int?,
            name: row['name'] as String?,
            birthday: row['birthday'] as String?,
            sex: row['sex'] == null ? null : Sex.values[row['sex'] as int],
            cpf: row['cpf'] as String?,
            rg: row['rg'] as String?,
            issuingAgency: row['issuingAgency'] as String?,
            cep: row['cep'] as String?,
            address: row['address'] as String?,
            neighborhood: row['neighborhood'] as String?,
            addressComplement: row['addressComplement'] as String?,
            skinColor: row['skinColor'] == null
                ? null
                : SkinColor.values[row['skinColor'] as int],
            fixNumber: row['fixNumber'] as String?,
            phone: row['phone'] as String?,
            placeOfBirth: row['placeOfBirth'] as String?,
            nationality: row['nationality'] as String?,
            maritalStatus: row['maritalStatus'] == null
                ? null
                : MaritalStatus.values[row['maritalStatus'] as int]),
        arguments: [name],
        queryableName: 'patient',
        isView: false);
  }

  @override
  Future<void> deletePatientByCPF(String cpf) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM patient WHERE cpf=?1', arguments: [cpf]);
  }

  @override
  Future<void> insert(Patient patient) async {
    await _patientInsertionAdapter.insert(patient, OnConflictStrategy.fail);
  }
}

class _$TriageDao extends TriageDao {
  _$TriageDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _triageInsertionAdapter = InsertionAdapter(
            database,
            'triage',
            (Triage item) => <String, Object?>{
                  'id': item.id,
                  'patientCPF': item.patientCPF,
                  'operatorCPF': item.operatorCPF,
                  'operatorName': item.operatorName,
                  'patientName': item.patientName,
                  'recordNumber': item.recordNumber,
                  'reasonForConsultation': item.reasonForConsultation,
                  'hasCovid':
                      item.hasCovid == null ? null : (item.hasCovid! ? 1 : 0),
                  'hasCough':
                      item.hasCough == null ? null : (item.hasCough! ? 1 : 0),
                  'testType': item.testType,
                  'kinship': item.kinship,
                  'hasFever':
                      item.hasFever == null ? null : (item.hasFever! ? 1 : 0),
                  'hasDifficultyToBreathing':
                      item.hasDifficultyToBreathing == null
                          ? null
                          : (item.hasDifficultyToBreathing! ? 1 : 0),
                  'hasTiredness': item.hasTiredness == null
                      ? null
                      : (item.hasTiredness! ? 1 : 0),
                  'hasLossOfSmell': item.hasLossOfSmell == null
                      ? null
                      : (item.hasLossOfSmell! ? 1 : 0),
                  'hasLossOfTaste': item.hasLossOfTaste == null
                      ? null
                      : (item.hasLossOfTaste! ? 1 : 0),
                  'hasSoreThroat': item.hasSoreThroat == null
                      ? null
                      : (item.hasSoreThroat! ? 1 : 0),
                  'hasHeadache': item.hasHeadache == null
                      ? null
                      : (item.hasHeadache! ? 1 : 0),
                  'hasDiarrhea': item.hasDiarrhea == null
                      ? null
                      : (item.hasDiarrhea! ? 1 : 0),
                  'oximetry': item.oximetry,
                  'heartRate': item.heartRate,
                  'temperature': item.temperature
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Triage> _triageInsertionAdapter;

  @override
  Future<List<Triage>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM triage',
        mapper: (Map<String, Object?> row) => Triage(
            id: row['id'] as int?,
            patientCPF: row['patientCPF'] as String?,
            operatorCPF: row['operatorCPF'] as String?,
            operatorName: row['operatorName'] as String?,
            patientName: row['patientName'] as String?,
            recordNumber: row['recordNumber'] as int?,
            reasonForConsultation: row['reasonForConsultation'] as String?,
            hasCovid:
                row['hasCovid'] == null ? null : (row['hasCovid'] as int) != 0,
            testType: row['testType'] as String?,
            kinship: row['kinship'] as String?,
            hasFever:
                row['hasFever'] == null ? null : (row['hasFever'] as int) != 0,
            hasDifficultyToBreathing: row['hasDifficultyToBreathing'] == null
                ? null
                : (row['hasDifficultyToBreathing'] as int) != 0,
            hasTiredness: row['hasTiredness'] == null
                ? null
                : (row['hasTiredness'] as int) != 0,
            hasLossOfSmell: row['hasLossOfSmell'] == null
                ? null
                : (row['hasLossOfSmell'] as int) != 0,
            hasLossOfTaste: row['hasLossOfTaste'] == null
                ? null
                : (row['hasLossOfTaste'] as int) != 0,
            hasSoreThroat: row['hasSoreThroat'] == null
                ? null
                : (row['hasSoreThroat'] as int) != 0,
            hasHeadache: row['hasHeadache'] == null
                ? null
                : (row['hasHeadache'] as int) != 0,
            hasDiarrhea: row['hasDiarrhea'] == null
                ? null
                : (row['hasDiarrhea'] as int) != 0,
            oximetry: row['oximetry'] as String?,
            heartRate: row['heartRate'] as String?,
            temperature: row['temperature'] as String?));
  }

  @override
  Stream<Triage?> findById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM triage WHERE id=?1',
        mapper: (Map<String, Object?> row) => Triage(
            id: row['id'] as int?,
            patientCPF: row['patientCPF'] as String?,
            operatorCPF: row['operatorCPF'] as String?,
            operatorName: row['operatorName'] as String?,
            patientName: row['patientName'] as String?,
            recordNumber: row['recordNumber'] as int?,
            reasonForConsultation: row['reasonForConsultation'] as String?,
            hasCovid:
                row['hasCovid'] == null ? null : (row['hasCovid'] as int) != 0,
            testType: row['testType'] as String?,
            kinship: row['kinship'] as String?,
            hasFever:
                row['hasFever'] == null ? null : (row['hasFever'] as int) != 0,
            hasDifficultyToBreathing: row['hasDifficultyToBreathing'] == null
                ? null
                : (row['hasDifficultyToBreathing'] as int) != 0,
            hasTiredness: row['hasTiredness'] == null
                ? null
                : (row['hasTiredness'] as int) != 0,
            hasLossOfSmell: row['hasLossOfSmell'] == null
                ? null
                : (row['hasLossOfSmell'] as int) != 0,
            hasLossOfTaste: row['hasLossOfTaste'] == null
                ? null
                : (row['hasLossOfTaste'] as int) != 0,
            hasSoreThroat: row['hasSoreThroat'] == null
                ? null
                : (row['hasSoreThroat'] as int) != 0,
            hasHeadache: row['hasHeadache'] == null
                ? null
                : (row['hasHeadache'] as int) != 0,
            hasDiarrhea: row['hasDiarrhea'] == null
                ? null
                : (row['hasDiarrhea'] as int) != 0,
            oximetry: row['oximetry'] as String?,
            heartRate: row['heartRate'] as String?,
            temperature: row['temperature'] as String?),
        arguments: [id],
        queryableName: 'triage',
        isView: false);
  }

  @override
  Stream<Triage?> findByRecordNumber(int recordNumber) {
    return _queryAdapter.queryStream(
        'SELECT * FROM triage WHERE recordNumber=?1',
        mapper: (Map<String, Object?> row) => Triage(
            id: row['id'] as int?,
            patientCPF: row['patientCPF'] as String?,
            operatorCPF: row['operatorCPF'] as String?,
            operatorName: row['operatorName'] as String?,
            patientName: row['patientName'] as String?,
            recordNumber: row['recordNumber'] as int?,
            reasonForConsultation: row['reasonForConsultation'] as String?,
            hasCovid:
                row['hasCovid'] == null ? null : (row['hasCovid'] as int) != 0,
            testType: row['testType'] as String?,
            kinship: row['kinship'] as String?,
            hasFever:
                row['hasFever'] == null ? null : (row['hasFever'] as int) != 0,
            hasDifficultyToBreathing: row['hasDifficultyToBreathing'] == null
                ? null
                : (row['hasDifficultyToBreathing'] as int) != 0,
            hasTiredness: row['hasTiredness'] == null
                ? null
                : (row['hasTiredness'] as int) != 0,
            hasLossOfSmell: row['hasLossOfSmell'] == null
                ? null
                : (row['hasLossOfSmell'] as int) != 0,
            hasLossOfTaste: row['hasLossOfTaste'] == null
                ? null
                : (row['hasLossOfTaste'] as int) != 0,
            hasSoreThroat: row['hasSoreThroat'] == null
                ? null
                : (row['hasSoreThroat'] as int) != 0,
            hasHeadache: row['hasHeadache'] == null
                ? null
                : (row['hasHeadache'] as int) != 0,
            hasDiarrhea: row['hasDiarrhea'] == null
                ? null
                : (row['hasDiarrhea'] as int) != 0,
            oximetry: row['oximetry'] as String?,
            heartRate: row['heartRate'] as String?,
            temperature: row['temperature'] as String?),
        arguments: [recordNumber],
        queryableName: 'triage',
        isView: false);
  }

  @override
  Stream<List<Triage?>> findByPatientCPF(String cpf) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM triage WHERE patientCPF=?1',
        mapper: (Map<String, Object?> row) => Triage(
            id: row['id'] as int?,
            patientCPF: row['patientCPF'] as String?,
            operatorCPF: row['operatorCPF'] as String?,
            operatorName: row['operatorName'] as String?,
            patientName: row['patientName'] as String?,
            recordNumber: row['recordNumber'] as int?,
            reasonForConsultation: row['reasonForConsultation'] as String?,
            hasCovid:
                row['hasCovid'] == null ? null : (row['hasCovid'] as int) != 0,
            testType: row['testType'] as String?,
            kinship: row['kinship'] as String?,
            hasFever:
                row['hasFever'] == null ? null : (row['hasFever'] as int) != 0,
            hasDifficultyToBreathing: row['hasDifficultyToBreathing'] == null
                ? null
                : (row['hasDifficultyToBreathing'] as int) != 0,
            hasTiredness: row['hasTiredness'] == null
                ? null
                : (row['hasTiredness'] as int) != 0,
            hasLossOfSmell: row['hasLossOfSmell'] == null
                ? null
                : (row['hasLossOfSmell'] as int) != 0,
            hasLossOfTaste: row['hasLossOfTaste'] == null
                ? null
                : (row['hasLossOfTaste'] as int) != 0,
            hasSoreThroat: row['hasSoreThroat'] == null
                ? null
                : (row['hasSoreThroat'] as int) != 0,
            hasHeadache: row['hasHeadache'] == null
                ? null
                : (row['hasHeadache'] as int) != 0,
            hasDiarrhea: row['hasDiarrhea'] == null
                ? null
                : (row['hasDiarrhea'] as int) != 0,
            oximetry: row['oximetry'] as String?,
            heartRate: row['heartRate'] as String?,
            temperature: row['temperature'] as String?),
        arguments: [cpf],
        queryableName: 'triage',
        isView: false);
  }

  @override
  Stream<List<Triage?>> findByOperatorCPF(String cpf) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM triage WHERE operatorCPF=?1',
        mapper: (Map<String, Object?> row) => Triage(
            id: row['id'] as int?,
            patientCPF: row['patientCPF'] as String?,
            operatorCPF: row['operatorCPF'] as String?,
            operatorName: row['operatorName'] as String?,
            patientName: row['patientName'] as String?,
            recordNumber: row['recordNumber'] as int?,
            reasonForConsultation: row['reasonForConsultation'] as String?,
            hasCovid:
                row['hasCovid'] == null ? null : (row['hasCovid'] as int) != 0,
            testType: row['testType'] as String?,
            kinship: row['kinship'] as String?,
            hasFever:
                row['hasFever'] == null ? null : (row['hasFever'] as int) != 0,
            hasDifficultyToBreathing: row['hasDifficultyToBreathing'] == null
                ? null
                : (row['hasDifficultyToBreathing'] as int) != 0,
            hasTiredness: row['hasTiredness'] == null
                ? null
                : (row['hasTiredness'] as int) != 0,
            hasLossOfSmell: row['hasLossOfSmell'] == null
                ? null
                : (row['hasLossOfSmell'] as int) != 0,
            hasLossOfTaste: row['hasLossOfTaste'] == null
                ? null
                : (row['hasLossOfTaste'] as int) != 0,
            hasSoreThroat: row['hasSoreThroat'] == null
                ? null
                : (row['hasSoreThroat'] as int) != 0,
            hasHeadache: row['hasHeadache'] == null
                ? null
                : (row['hasHeadache'] as int) != 0,
            hasDiarrhea: row['hasDiarrhea'] == null
                ? null
                : (row['hasDiarrhea'] as int) != 0,
            oximetry: row['oximetry'] as String?,
            heartRate: row['heartRate'] as String?,
            temperature: row['temperature'] as String?),
        arguments: [cpf],
        queryableName: 'triage',
        isView: false);
  }

  @override
  Future<void> deletePatientByCPF(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM triage WHERE id=?1', arguments: [id]);
  }

  @override
  Future<void> insert(Triage triage) async {
    await _triageInsertionAdapter.insert(triage, OnConflictStrategy.fail);
  }
}

class _$ExamDao extends ExamDao {
  _$ExamDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _examInsertionAdapter = InsertionAdapter(
            database,
            'exam',
            (Exam item) => <String, Object?>{
                  'id': item.id,
                  'patientCPF': item.patientCPF,
                  'generalType': item.generalType?.index,
                  'weight': item.weight,
                  'height': item.height,
                  'temperature': item.temperature,
                  'bloodPressure': item.bloodPressure,
                  'pulsation': item.pulsation,
                  'oximetry': item.oximetry,
                  'othersObservations': item.othersObservations,
                  'skinColor': item.skinColor?.index,
                  'skinColoring': item.skinColoring,
                  'consistency': item.consistency,
                  'skinTexture': item.skinTexture,
                  'eyeColor': item.eyeColor,
                  'hairColor': item.hairColor,
                  'asymmetryType': item.asymmetryType?.index,
                  'surfaceType': item.surfaceType?.index,
                  'mobilityType': item.mobilityType?.index,
                  'sensibilityType': item.sensibilityType?.index,
                  'lipsType': item.lipsType?.index,
                  'tongueType': item.tongueType?.index,
                  'buccalMucosa': item.buccalMucosa,
                  'gum': item.gum,
                  'alveolarRidge': item.alveolarRidge,
                  'retromolarTrigone': item.retromolarTrigone,
                  'mouthFloor': item.mouthFloor,
                  'palateModel': item.palateModel,
                  'tonsilPillars': item.tonsilPillars,
                  'variationNormality': item.variationNormality,
                  'whichVariations': item.whichVariations,
                  'injuryPresence': item.injuryPresence,
                  'injuryDescription': item.injuryDescription,
                  'complementaryExams': item.complementaryExams,
                  'examResult': item.examResult,
                  'definitiveDiagnosis': item.definitiveDiagnosis,
                  'conduct': item.conduct,
                  'diagnosticHypothesis': item.diagnosticHypothesis
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Exam> _examInsertionAdapter;

  @override
  Future<List<Exam>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM exam',
        mapper: (Map<String, Object?> row) => Exam(
            id: row['id'] as int?,
            generalType: row['generalType'] == null
                ? null
                : GeneralType.values[row['generalType'] as int],
            weight: row['weight'] as String?,
            height: row['height'] as String?,
            temperature: row['temperature'] as String?,
            bloodPressure: row['bloodPressure'] as String?,
            pulsation: row['pulsation'] as String?,
            oximetry: row['oximetry'] as String?,
            othersObservations: row['othersObservations'] as String?,
            skinColor: row['skinColor'] == null
                ? null
                : SkinColor.values[row['skinColor'] as int],
            skinColoring: row['skinColoring'] as String?,
            consistency: row['consistency'] as String?,
            skinTexture: row['skinTexture'] as String?,
            eyeColor: row['eyeColor'] as String?,
            hairColor: row['hairColor'] as String?,
            asymmetryType: row['asymmetryType'] == null
                ? null
                : Asymmetry.values[row['asymmetryType'] as int],
            surfaceType: row['surfaceType'] == null
                ? null
                : Surface.values[row['surfaceType'] as int],
            mobilityType: row['mobilityType'] == null
                ? null
                : Mobility.values[row['mobilityType'] as int],
            sensibilityType: row['sensibilityType'] == null
                ? null
                : Sensibility.values[row['sensibilityType'] as int],
            lipsType: row['lipsType'] == null
                ? null
                : Lip.values[row['lipsType'] as int],
            tongueType: row['tongueType'] == null
                ? null
                : Tongue.values[row['tongueType'] as int],
            buccalMucosa: row['buccalMucosa'] as String?,
            gum: row['gum'] as String?,
            alveolarRidge: row['alveolarRidge'] as String?,
            retromolarTrigone: row['retromolarTrigone'] as String?,
            mouthFloor: row['mouthFloor'] as String?,
            palateModel: row['palateModel'] as String?,
            tonsilPillars: row['tonsilPillars'] as String?,
            variationNormality: row['variationNormality'] as String?,
            whichVariations: row['whichVariations'] as String?,
            injuryPresence: row['injuryPresence'] as String?,
            injuryDescription: row['injuryDescription'] as String?,
            complementaryExams: row['complementaryExams'] as String?,
            examResult: row['examResult'] as String?,
            definitiveDiagnosis: row['definitiveDiagnosis'] as String?,
            diagnosticHypothesis: row['diagnosticHypothesis'] as String?,
            conduct: row['conduct'] as String?));
  }

  @override
  Stream<List<Exam>> findByCPF(String cpf) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM exam WHERE patientCPF=?1',
        mapper: (Map<String, Object?> row) => Exam(
            id: row['id'] as int?,
            generalType: row['generalType'] == null
                ? null
                : GeneralType.values[row['generalType'] as int],
            weight: row['weight'] as String?,
            height: row['height'] as String?,
            temperature: row['temperature'] as String?,
            bloodPressure: row['bloodPressure'] as String?,
            pulsation: row['pulsation'] as String?,
            oximetry: row['oximetry'] as String?,
            othersObservations: row['othersObservations'] as String?,
            skinColor: row['skinColor'] == null
                ? null
                : SkinColor.values[row['skinColor'] as int],
            skinColoring: row['skinColoring'] as String?,
            consistency: row['consistency'] as String?,
            skinTexture: row['skinTexture'] as String?,
            eyeColor: row['eyeColor'] as String?,
            hairColor: row['hairColor'] as String?,
            asymmetryType: row['asymmetryType'] == null
                ? null
                : Asymmetry.values[row['asymmetryType'] as int],
            surfaceType: row['surfaceType'] == null
                ? null
                : Surface.values[row['surfaceType'] as int],
            mobilityType: row['mobilityType'] == null
                ? null
                : Mobility.values[row['mobilityType'] as int],
            sensibilityType: row['sensibilityType'] == null
                ? null
                : Sensibility.values[row['sensibilityType'] as int],
            lipsType: row['lipsType'] == null
                ? null
                : Lip.values[row['lipsType'] as int],
            tongueType: row['tongueType'] == null
                ? null
                : Tongue.values[row['tongueType'] as int],
            buccalMucosa: row['buccalMucosa'] as String?,
            gum: row['gum'] as String?,
            alveolarRidge: row['alveolarRidge'] as String?,
            retromolarTrigone: row['retromolarTrigone'] as String?,
            mouthFloor: row['mouthFloor'] as String?,
            palateModel: row['palateModel'] as String?,
            tonsilPillars: row['tonsilPillars'] as String?,
            variationNormality: row['variationNormality'] as String?,
            whichVariations: row['whichVariations'] as String?,
            injuryPresence: row['injuryPresence'] as String?,
            injuryDescription: row['injuryDescription'] as String?,
            complementaryExams: row['complementaryExams'] as String?,
            examResult: row['examResult'] as String?,
            definitiveDiagnosis: row['definitiveDiagnosis'] as String?,
            diagnosticHypothesis: row['diagnosticHypothesis'] as String?,
            conduct: row['conduct'] as String?),
        arguments: [cpf],
        queryableName: 'exam',
        isView: false);
  }

  @override
  Future<void> insert(Exam exam) async {
    await _examInsertionAdapter.insert(exam, OnConflictStrategy.fail);
  }
}

class _$AnamnesisDao extends AnamnesisDao {
  _$AnamnesisDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _anamnesisInsertionAdapter = InsertionAdapter(
            database,
            'anamnesis',
            (Anamnesis item) => <String, Object?>{
                  'id': item.id,
                  'patientCPF': item.patientCPF,
                  'complain': item.complain,
                  'diseaseHistory': item.diseaseHistory,
                  'diseases': item.diseases,
                  'currentTreatment': item.currentTreatment,
                  'forWhat': item.forWhat,
                  'pregnancy': item.pregnancy,
                  'howManyMonth': item.howManyMonth,
                  'prenatalExam': item.prenatalExam == null
                      ? null
                      : (item.prenatalExam! ? 1 : 0),
                  'medicalRecommendations': item.medicalRecommendations,
                  'useMedicine': item.useMedicine,
                  'whichMedicines': item.whichMedicines,
                  'doctorName': item.doctorName,
                  'allergy': item.allergy?.index,
                  'surgery': item.surgery,
                  'hasHealingProblem': item.hasHealingProblem == null
                      ? null
                      : (item.hasHealingProblem! ? 1 : 0),
                  'healingProblemSituation': item.healingProblemSituation,
                  'hasProblemWithAnesthesia':
                      item.hasProblemWithAnesthesia == null
                          ? null
                          : (item.hasProblemWithAnesthesia! ? 1 : 0),
                  'problemWithAnesthesiaSituation':
                      item.problemWithAnesthesiaSituation,
                  'hasBleedingProblem': item.hasBleedingProblem == null
                      ? null
                      : (item.hasBleedingProblem! ? 1 : 0),
                  'bleedingProblemSituation': item.bleedingProblemSituation,
                  'hasRheumaticFever': item.hasRheumaticFever == null
                      ? null
                      : (item.hasRheumaticFever! ? 1 : 0),
                  'hasKidneyProblem': item.hasKidneyProblem == null
                      ? null
                      : (item.hasKidneyProblem! ? 1 : 0),
                  'hasRespiratoryProblem': item.hasRespiratoryProblem == null
                      ? null
                      : (item.hasRespiratoryProblem! ? 1 : 0),
                  'hasJointProblem': item.hasJointProblem == null
                      ? null
                      : (item.hasJointProblem! ? 1 : 0),
                  'hasHighBloodPressureProblem':
                      item.hasHighBloodPressureProblem == null
                          ? null
                          : (item.hasHighBloodPressureProblem! ? 1 : 0),
                  'hasHeartProblem': item.hasHeartProblem == null
                      ? null
                      : (item.hasHeartProblem! ? 1 : 0),
                  'hasGastricProblem': item.hasGastricProblem == null
                      ? null
                      : (item.hasGastricProblem! ? 1 : 0),
                  'hasAnemia':
                      item.hasAnemia == null ? null : (item.hasAnemia! ? 1 : 0),
                  'hasDiabetes': item.hasDiabetes == null
                      ? null
                      : (item.hasDiabetes! ? 1 : 0),
                  'hasNeurologicalProblems':
                      item.hasNeurologicalProblems == null
                          ? null
                          : (item.hasNeurologicalProblems! ? 1 : 0),
                  'infectiousDiseases': item.infectiousDiseases?.index,
                  'underwentChemotherapy': item.underwentChemotherapy == null
                      ? null
                      : (item.underwentChemotherapy! ? 1 : 0),
                  'hasOnychophagy': item.hasOnychophagy == null
                      ? null
                      : (item.hasOnychophagy! ? 1 : 0),
                  'hasMouthPiece': item.hasMouthPiece == null
                      ? null
                      : (item.hasMouthPiece! ? 1 : 0),
                  'hasBruxism': item.hasBruxism == null
                      ? null
                      : (item.hasBruxism! ? 1 : 0),
                  'isSmoker':
                      item.isSmoker == null ? null : (item.isSmoker! ? 1 : 0),
                  'cigaretteType': item.cigaretteType,
                  'isAlcoholic': item.isAlcoholic == null
                      ? null
                      : (item.isAlcoholic! ? 1 : 0),
                  'drinkType': item.drinkType,
                  'otherHabits': item.otherHabits,
                  'familyBackground': item.familyBackground?.index,
                  'hasAnxiety': item.hasAnxiety,
                  'dentalTreatment': item.dentalTreatment,
                  'lastVisitToTheDentist': item.lastVisitToTheDentist,
                  'negativeExperience': item.negativeExperience,
                  'whatKindOfTreatment': item.whatKindOfTreatment,
                  'brushNumber': item.brushNumber,
                  'brushType': item.brushType,
                  'useDentalFloss': item.useDentalFloss == null
                      ? null
                      : (item.useDentalFloss! ? 1 : 0),
                  'hasDryMouthFeeling': item.hasDryMouthFeeling == null
                      ? null
                      : (item.hasDryMouthFeeling! ? 1 : 0),
                  'feelBurning': item.feelBurning == null
                      ? null
                      : (item.feelBurning! ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Anamnesis> _anamnesisInsertionAdapter;

  @override
  Future<List<Anamnesis>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM anamnesis',
        mapper: (Map<String, Object?> row) => Anamnesis(
            id: row['id'] as int?,
            patientCPF: row['patientCPF'] as String?,
            complain: row['complain'] as String?,
            diseaseHistory: row['diseaseHistory'] as String?,
            diseases: row['diseases'] as String?,
            currentTreatment: row['currentTreatment'] as String?,
            forWhat: row['forWhat'] as String?,
            pregnancy: row['pregnancy'] as String?,
            howManyMonth: row['howManyMonth'] as String?,
            prenatalExam: row['prenatalExam'] == null
                ? null
                : (row['prenatalExam'] as int) != 0,
            medicalRecommendations: row['medicalRecommendations'] as String?,
            useMedicine: row['useMedicine'] as String?,
            whichMedicines: row['whichMedicines'] as String?,
            doctorName: row['doctorName'] as String?,
            allergy: row['allergy'] == null
                ? null
                : Allergy.values[row['allergy'] as int],
            surgery: row['surgery'] as String?,
            hasHealingProblem: row['hasHealingProblem'] == null
                ? null
                : (row['hasHealingProblem'] as int) != 0,
            healingProblemSituation: row['healingProblemSituation'] as String?,
            hasProblemWithAnesthesia: row['hasProblemWithAnesthesia'] == null
                ? null
                : (row['hasProblemWithAnesthesia'] as int) != 0,
            problemWithAnesthesiaSituation:
                row['problemWithAnesthesiaSituation'] as String?,
            hasBleedingProblem: row['hasBleedingProblem'] == null
                ? null
                : (row['hasBleedingProblem'] as int) != 0,
            bleedingProblemSituation:
                row['bleedingProblemSituation'] as String?,
            hasRheumaticFever: row['hasRheumaticFever'] == null
                ? null
                : (row['hasRheumaticFever'] as int) != 0,
            hasKidneyProblem: row['hasKidneyProblem'] == null
                ? null
                : (row['hasKidneyProblem'] as int) != 0,
            hasRespiratoryProblem: row['hasRespiratoryProblem'] == null
                ? null
                : (row['hasRespiratoryProblem'] as int) != 0,
            hasJointProblem: row['hasJointProblem'] == null
                ? null
                : (row['hasJointProblem'] as int) != 0,
            hasHighBloodPressureProblem: row['hasHighBloodPressureProblem'] == null
                ? null
                : (row['hasHighBloodPressureProblem'] as int) != 0,
            hasHeartProblem: row['hasHeartProblem'] == null
                ? null
                : (row['hasHeartProblem'] as int) != 0,
            hasGastricProblem: row['hasGastricProblem'] == null
                ? null
                : (row['hasGastricProblem'] as int) != 0,
            hasAnemia:
                row['hasAnemia'] == null ? null : (row['hasAnemia'] as int) != 0,
            hasDiabetes: row['hasDiabetes'] == null ? null : (row['hasDiabetes'] as int) != 0,
            hasNeurologicalProblems: row['hasNeurologicalProblems'] == null ? null : (row['hasNeurologicalProblems'] as int) != 0,
            infectiousDiseases: row['infectiousDiseases'] == null ? null : InfectiousDiseases.values[row['infectiousDiseases'] as int],
            underwentChemotherapy: row['underwentChemotherapy'] == null ? null : (row['underwentChemotherapy'] as int) != 0,
            hasOnychophagy: row['hasOnychophagy'] == null ? null : (row['hasOnychophagy'] as int) != 0,
            hasMouthPiece: row['hasMouthPiece'] == null ? null : (row['hasMouthPiece'] as int) != 0,
            hasBruxism: row['hasBruxism'] == null ? null : (row['hasBruxism'] as int) != 0,
            isSmoker: row['isSmoker'] == null ? null : (row['isSmoker'] as int) != 0,
            cigaretteType: row['cigaretteType'] as String?,
            isAlcoholic: row['isAlcoholic'] == null ? null : (row['isAlcoholic'] as int) != 0,
            drinkType: row['drinkType'] as String?,
            otherHabits: row['otherHabits'] as String?,
            familyBackground: row['familyBackground'] == null ? null : FamilyBackground.values[row['familyBackground'] as int],
            hasAnxiety: row['hasAnxiety'] as String?,
            dentalTreatment: row['dentalTreatment'] as String?,
            lastVisitToTheDentist: row['lastVisitToTheDentist'] as String?,
            negativeExperience: row['negativeExperience'] as String?,
            whatKindOfTreatment: row['whatKindOfTreatment'] as String?,
            brushNumber: row['brushNumber'] as String?,
            brushType: row['brushType'] as String?,
            useDentalFloss: row['useDentalFloss'] == null ? null : (row['useDentalFloss'] as int) != 0,
            hasDryMouthFeeling: row['hasDryMouthFeeling'] == null ? null : (row['hasDryMouthFeeling'] as int) != 0,
            feelBurning: row['feelBurning'] == null ? null : (row['feelBurning'] as int) != 0));
  }

  @override
  Stream<List<Anamnesis>> findByCPF(String cpf) {
    return _queryAdapter.queryListStream('SELECT * FROM anamnesis WHERE patientCPF=?1',
        mapper: (Map<String, Object?> row) => Anamnesis(
            id: row['id'] as int?,
            patientCPF: row['patientCPF'] as String?,
            complain: row['complain'] as String?,
            diseaseHistory: row['diseaseHistory'] as String?,
            diseases: row['diseases'] as String?,
            currentTreatment: row['currentTreatment'] as String?,
            forWhat: row['forWhat'] as String?,
            pregnancy: row['pregnancy'] as String?,
            howManyMonth: row['howManyMonth'] as String?,
            prenatalExam: row['prenatalExam'] == null
                ? null
                : (row['prenatalExam'] as int) != 0,
            medicalRecommendations: row['medicalRecommendations'] as String?,
            useMedicine: row['useMedicine'] as String?,
            whichMedicines: row['whichMedicines'] as String?,
            doctorName: row['doctorName'] as String?,
            allergy: row['allergy'] == null
                ? null
                : Allergy.values[row['allergy'] as int],
            surgery: row['surgery'] as String?,
            hasHealingProblem: row['hasHealingProblem'] == null
                ? null
                : (row['hasHealingProblem'] as int) != 0,
            healingProblemSituation: row['healingProblemSituation'] as String?,
            hasProblemWithAnesthesia: row['hasProblemWithAnesthesia'] == null
                ? null
                : (row['hasProblemWithAnesthesia'] as int) != 0,
            problemWithAnesthesiaSituation:
                row['problemWithAnesthesiaSituation'] as String?,
            hasBleedingProblem: row['hasBleedingProblem'] == null
                ? null
                : (row['hasBleedingProblem'] as int) != 0,
            bleedingProblemSituation:
                row['bleedingProblemSituation'] as String?,
            hasRheumaticFever: row['hasRheumaticFever'] == null
                ? null
                : (row['hasRheumaticFever'] as int) != 0,
            hasKidneyProblem: row['hasKidneyProblem'] == null
                ? null
                : (row['hasKidneyProblem'] as int) != 0,
            hasRespiratoryProblem: row['hasRespiratoryProblem'] == null
                ? null
                : (row['hasRespiratoryProblem'] as int) != 0,
            hasJointProblem: row['hasJointProblem'] == null
                ? null
                : (row['hasJointProblem'] as int) != 0,
            hasHighBloodPressureProblem: row['hasHighBloodPressureProblem'] == null
                ? null
                : (row['hasHighBloodPressureProblem'] as int) != 0,
            hasHeartProblem: row['hasHeartProblem'] == null
                ? null
                : (row['hasHeartProblem'] as int) != 0,
            hasGastricProblem: row['hasGastricProblem'] == null ? null : (row['hasGastricProblem'] as int) != 0,
            hasAnemia: row['hasAnemia'] == null ? null : (row['hasAnemia'] as int) != 0,
            hasDiabetes: row['hasDiabetes'] == null ? null : (row['hasDiabetes'] as int) != 0,
            hasNeurologicalProblems: row['hasNeurologicalProblems'] == null ? null : (row['hasNeurologicalProblems'] as int) != 0,
            infectiousDiseases: row['infectiousDiseases'] == null ? null : InfectiousDiseases.values[row['infectiousDiseases'] as int],
            underwentChemotherapy: row['underwentChemotherapy'] == null ? null : (row['underwentChemotherapy'] as int) != 0,
            hasOnychophagy: row['hasOnychophagy'] == null ? null : (row['hasOnychophagy'] as int) != 0,
            hasMouthPiece: row['hasMouthPiece'] == null ? null : (row['hasMouthPiece'] as int) != 0,
            hasBruxism: row['hasBruxism'] == null ? null : (row['hasBruxism'] as int) != 0,
            isSmoker: row['isSmoker'] == null ? null : (row['isSmoker'] as int) != 0,
            cigaretteType: row['cigaretteType'] as String?,
            isAlcoholic: row['isAlcoholic'] == null ? null : (row['isAlcoholic'] as int) != 0,
            drinkType: row['drinkType'] as String?,
            otherHabits: row['otherHabits'] as String?,
            familyBackground: row['familyBackground'] == null ? null : FamilyBackground.values[row['familyBackground'] as int],
            hasAnxiety: row['hasAnxiety'] as String?,
            dentalTreatment: row['dentalTreatment'] as String?,
            lastVisitToTheDentist: row['lastVisitToTheDentist'] as String?,
            negativeExperience: row['negativeExperience'] as String?,
            whatKindOfTreatment: row['whatKindOfTreatment'] as String?,
            brushNumber: row['brushNumber'] as String?,
            brushType: row['brushType'] as String?,
            useDentalFloss: row['useDentalFloss'] == null ? null : (row['useDentalFloss'] as int) != 0,
            hasDryMouthFeeling: row['hasDryMouthFeeling'] == null ? null : (row['hasDryMouthFeeling'] as int) != 0,
            feelBurning: row['feelBurning'] == null ? null : (row['feelBurning'] as int) != 0),
        arguments: [cpf],
        queryableName: 'anamnesis',
        isView: false);
  }

  @override
  Future<void> insert(Anamnesis anamnesis) async {
    await _anamnesisInsertionAdapter.insert(anamnesis, OnConflictStrategy.fail);
  }
}
