// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorProodontoDB {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ProodontoDBBuilder databaseBuilder(String name) =>
      _$ProodontoDBBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ProodontoDBBuilder inMemoryDatabaseBuilder() =>
      _$ProodontoDBBuilder(null);
}

class _$ProodontoDBBuilder {
  _$ProodontoDBBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$ProodontoDBBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$ProodontoDBBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<ProodontoDB> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$ProodontoDB();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$ProodontoDB extends ProodontoDB {
  _$ProodontoDB([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PatientDao? _patientDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `patient` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `recordNumber` INTEGER NOT NULL, `advisor` TEXT NOT NULL, `semester` TEXT NOT NULL, `careUnit` TEXT NOT NULL, `profession` TEXT NOT NULL, `workAddress` TEXT NOT NULL, `email` TEXT NOT NULL, `initialExam` TEXT NOT NULL, `responsibleName` TEXT NOT NULL, `responsibleRG` TEXT NOT NULL, `responsibleIssuingAgency` TEXT NOT NULL, `parentalRelationship` TEXT NOT NULL, `responsiblePhoneNumber` TEXT NOT NULL, `name` TEXT NOT NULL, `birthday` TEXT NOT NULL, `sex` INTEGER NOT NULL, `cpf` TEXT NOT NULL, `rg` TEXT NOT NULL, `issuingAgency` TEXT NOT NULL, `cep` TEXT NOT NULL, `address` TEXT NOT NULL, `neighborhood` TEXT NOT NULL, `addressComplement` TEXT NOT NULL, `skinColor` INTEGER NOT NULL, `fixNumber` TEXT NOT NULL, `phone` TEXT NOT NULL, `placeOfBirth` TEXT NOT NULL, `nationality` TEXT NOT NULL, `maritalStatus` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PatientDao get patientDao {
    return _patientDaoInstance ??= _$PatientDao(database, changeListener);
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
                  'id': item.id,
                  'recordNumber': item.recordNumber,
                  'advisor': item.advisor,
                  'semester': item.semester,
                  'careUnit': item.careUnit,
                  'profession': item.profession,
                  'workAddress': item.workAddress,
                  'email': item.email,
                  'initialExam': item.initialExam,
                  'responsibleName': item.responsibleName,
                  'responsibleRG': item.responsibleRG,
                  'responsibleIssuingAgency': item.responsibleIssuingAgency,
                  'parentalRelationship': item.parentalRelationship,
                  'responsiblePhoneNumber': item.responsiblePhoneNumber,
                  'name': item.name,
                  'birthday': item.birthday,
                  'sex': item.sex.index,
                  'cpf': item.cpf,
                  'rg': item.rg,
                  'issuingAgency': item.issuingAgency,
                  'cep': item.cep,
                  'address': item.address,
                  'neighborhood': item.neighborhood,
                  'addressComplement': item.addressComplement,
                  'skinColor': item.skinColor.index,
                  'fixNumber': item.fixNumber,
                  'phone': item.phone,
                  'placeOfBirth': item.placeOfBirth,
                  'nationality': item.nationality,
                  'maritalStatus': item.maritalStatus.index
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Patient> _patientInsertionAdapter;

  @override
  Future<List<Patient>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM Patient',
        mapper: (Map<String, Object?> row) => Patient(
            id: row['id'] as int,
            recordNumber: row['recordNumber'] as int,
            advisor: row['advisor'] as String,
            semester: row['semester'] as String,
            careUnit: row['careUnit'] as String,
            profession: row['profession'] as String,
            workAddress: row['workAddress'] as String,
            email: row['email'] as String,
            initialExam: row['initialExam'] as String,
            responsibleName: row['responsibleName'] as String,
            responsibleRG: row['responsibleRG'] as String,
            responsibleIssuingAgency: row['responsibleIssuingAgency'] as String,
            parentalRelationship: row['parentalRelationship'] as String,
            responsiblePhoneNumber: row['responsiblePhoneNumber'] as String,
            name: row['name'] as String,
            birthday: row['birthday'] as String,
            sex: Sex.values[row['sex'] as int],
            cpf: row['cpf'] as String,
            rg: row['rg'] as String,
            issuingAgency: row['issuingAgency'] as String,
            cep: row['cep'] as String,
            address: row['address'] as String,
            neighborhood: row['neighborhood'] as String,
            addressComplement: row['addressComplement'] as String,
            skinColor: SkinColor.values[row['skinColor'] as int],
            fixNumber: row['fixNumber'] as String,
            phone: row['phone'] as String,
            placeOfBirth: row['placeOfBirth'] as String,
            nationality: row['nationality'] as String,
            maritalStatus: MaritalStatus.values[row['maritalStatus'] as int]));
  }

  @override
  Stream<Patient?> findById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Patient WHERE id=?1',
        mapper: (Map<String, Object?> row) => Patient(
            id: row['id'] as int,
            recordNumber: row['recordNumber'] as int,
            advisor: row['advisor'] as String,
            semester: row['semester'] as String,
            careUnit: row['careUnit'] as String,
            profession: row['profession'] as String,
            workAddress: row['workAddress'] as String,
            email: row['email'] as String,
            initialExam: row['initialExam'] as String,
            responsibleName: row['responsibleName'] as String,
            responsibleRG: row['responsibleRG'] as String,
            responsibleIssuingAgency: row['responsibleIssuingAgency'] as String,
            parentalRelationship: row['parentalRelationship'] as String,
            responsiblePhoneNumber: row['responsiblePhoneNumber'] as String,
            name: row['name'] as String,
            birthday: row['birthday'] as String,
            sex: Sex.values[row['sex'] as int],
            cpf: row['cpf'] as String,
            rg: row['rg'] as String,
            issuingAgency: row['issuingAgency'] as String,
            cep: row['cep'] as String,
            address: row['address'] as String,
            neighborhood: row['neighborhood'] as String,
            addressComplement: row['addressComplement'] as String,
            skinColor: SkinColor.values[row['skinColor'] as int],
            fixNumber: row['fixNumber'] as String,
            phone: row['phone'] as String,
            placeOfBirth: row['placeOfBirth'] as String,
            nationality: row['nationality'] as String,
            maritalStatus: MaritalStatus.values[row['maritalStatus'] as int]),
        arguments: [id],
        queryableName: 'Patient',
        isView: false);
  }

  @override
  Stream<Patient?> findByCPF(String cpf) {
    return _queryAdapter.queryStream('SELECT * FROM Patient WHERE cpf=?1',
        mapper: (Map<String, Object?> row) => Patient(
            id: row['id'] as int,
            recordNumber: row['recordNumber'] as int,
            advisor: row['advisor'] as String,
            semester: row['semester'] as String,
            careUnit: row['careUnit'] as String,
            profession: row['profession'] as String,
            workAddress: row['workAddress'] as String,
            email: row['email'] as String,
            initialExam: row['initialExam'] as String,
            responsibleName: row['responsibleName'] as String,
            responsibleRG: row['responsibleRG'] as String,
            responsibleIssuingAgency: row['responsibleIssuingAgency'] as String,
            parentalRelationship: row['parentalRelationship'] as String,
            responsiblePhoneNumber: row['responsiblePhoneNumber'] as String,
            name: row['name'] as String,
            birthday: row['birthday'] as String,
            sex: Sex.values[row['sex'] as int],
            cpf: row['cpf'] as String,
            rg: row['rg'] as String,
            issuingAgency: row['issuingAgency'] as String,
            cep: row['cep'] as String,
            address: row['address'] as String,
            neighborhood: row['neighborhood'] as String,
            addressComplement: row['addressComplement'] as String,
            skinColor: SkinColor.values[row['skinColor'] as int],
            fixNumber: row['fixNumber'] as String,
            phone: row['phone'] as String,
            placeOfBirth: row['placeOfBirth'] as String,
            nationality: row['nationality'] as String,
            maritalStatus: MaritalStatus.values[row['maritalStatus'] as int]),
        arguments: [cpf],
        queryableName: 'Patient',
        isView: false);
  }

  @override
  Stream<List<Patient>?> findByName(String name) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM Patient WHERE name like ?1',
        mapper: (Map<String, Object?> row) => Patient(
            id: row['id'] as int,
            recordNumber: row['recordNumber'] as int,
            advisor: row['advisor'] as String,
            semester: row['semester'] as String,
            careUnit: row['careUnit'] as String,
            profession: row['profession'] as String,
            workAddress: row['workAddress'] as String,
            email: row['email'] as String,
            initialExam: row['initialExam'] as String,
            responsibleName: row['responsibleName'] as String,
            responsibleRG: row['responsibleRG'] as String,
            responsibleIssuingAgency: row['responsibleIssuingAgency'] as String,
            parentalRelationship: row['parentalRelationship'] as String,
            responsiblePhoneNumber: row['responsiblePhoneNumber'] as String,
            name: row['name'] as String,
            birthday: row['birthday'] as String,
            sex: Sex.values[row['sex'] as int],
            cpf: row['cpf'] as String,
            rg: row['rg'] as String,
            issuingAgency: row['issuingAgency'] as String,
            cep: row['cep'] as String,
            address: row['address'] as String,
            neighborhood: row['neighborhood'] as String,
            addressComplement: row['addressComplement'] as String,
            skinColor: SkinColor.values[row['skinColor'] as int],
            fixNumber: row['fixNumber'] as String,
            phone: row['phone'] as String,
            placeOfBirth: row['placeOfBirth'] as String,
            nationality: row['nationality'] as String,
            maritalStatus: MaritalStatus.values[row['maritalStatus'] as int]),
        arguments: [name],
        queryableName: 'Patient',
        isView: false);
  }

  @override
  Future<void> deletePatientByCPF(String cpf) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM patient WHERE cpf=?1', arguments: [cpf]);
  }

  @override
  Future<void> insert(Patient patient) async {
    await _patientInsertionAdapter.insert(patient, OnConflictStrategy.abort);
  }
}
