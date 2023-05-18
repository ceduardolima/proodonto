import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/database/entity/patient.dart';
import 'package:proodonto/app/pages/home/home.dart';
import 'package:proodonto/app/shared/default_form_field.dart';
import 'package:proodonto/app/shared/default_size.dart';
import 'package:proodonto/app/shared/enum_types.dart';

class RegisterPatientResponsible extends StatelessWidget {
  const RegisterPatientResponsible(
      {Key? key, required this.database, required this.patient})
      : super(key: key);
  final ProodontoDatabase database;
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar responsável"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PaddingSize.big),
        child: SingleChildScrollView(
          child: _PacientResponsibleForm(
            database: database,
            patient: patient,
          ),
        ),
      ),
    );
  }
}

class _PacientResponsibleForm extends StatelessWidget {
  _PacientResponsibleForm(
      {Key? key, required this.database, required this.patient})
      : super(key: key) {
    finish.addListener(() {
      if (finish.value) {}
    });
  }

  final _formKey = GlobalKey<FormBuilderState>();
  final ProodontoDatabase database;
  final Patient patient;
  final ValueNotifier<bool> finish = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          DefaultFormField(
            name: "responsibleName",
            label: "Nome do responsável",
            initialValue: patient.responsibleName,
          ),
          DefaultFormField(
            name: "responsibleAddress",
            label: "Endereço do responsável",
            initialValue: patient.responsibleAddress,
          ),
          DefaultFormField(
            name: "responsibleRG",
            label: "RG do responsável",
            inputType: TextInputType.number,
            initialValue: patient.responsibleRG,
          ),
          DefaultFormField(
            name: "responsibleIssuingAgency",
            label: "Orgão expedidor do responsável",
            initialValue: patient.responsibleIssuingAgency,
          ),
          DefaultFormField(
            name: "parentalRelationship",
            label: "Relação parental",
            initialValue: patient.parentalRelationship,
          ),
          DefaultFormField(
            name: "responsibleNumber",
            label: "Telefone do responsável",
            initialValue: patient.responsiblePhoneNumber,
            inputType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () => onPressed(context),
            style: ElevatedButton.styleFrom(
              alignment: Alignment.center,
              minimumSize: const Size.fromHeight(50),
            ),
            child: const Text("Próximo"),
          ),
        ],
      ),
    );
  }

  void onPressed(BuildContext context) {
    bool isValid = _validateItems();
    if (isValid) {
      _addFieldToPatientMap();
      _insertPatient(context, patient);
    }
  }

  bool _validateItems() {
    final values = _formKey.currentState?.fields.values.toList();
    bool isValid = true;
    values?.forEach((element) {
      element.validate();
      if (!element.isValid) {
        isValid = false;
      }
    });
    return isValid;
  }

  void _addFieldToPatientMap() {
    final fields = _formKey.currentState?.fields;
    patient.responsibleName = fields!["responsibleName"]?.value;
    patient.responsibleAddress = fields["responsibleAddress"]?.value;
    patient.responsibleRG = fields["responsibleRG"]?.value;
    patient.responsibleIssuingAgency =
        fields["responsibleIssuingAgency"]?.value;
    patient.parentalRelationship = fields["parentalRelationship"]?.value;
    patient.responsiblePhoneNumber = fields["responsibleNumber"]?.value;
  }

  void _insertPatient(BuildContext context, Patient patient) async {
    _showDialog(context);
    await database.patientDao.insert(patient);
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      _finishRegister(context);
    }
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: PaddingSize.large, horizontal: PaddingSize.big),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircularProgressIndicator(),
                  Spacer(),
                  Text("Inserindo dados..."),
                  Spacer(
                    flex: 2,
                  )
                ],
              ),
            ),
          );
        });
  }

  void _finishRegister(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  database: database,
                )),
        (route) => false);
  }
}
