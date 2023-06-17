import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/shared/default_form_field.dart';

class TriageBasicInfoForm extends StatelessWidget {
  TriageBasicInfoForm({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: key,
      child: Column(
        children: [
          DefaultFormField(
            name: "operatorName",
            label: "CPF do operador",
          ),
          DefaultFormField(
            name: "recordNumber",
            label: "Número do prontuário",
            inputType: TextInputType.number,
          ),
          DefaultFormField(
            name: "patientName",
            label: "Nome do paciênte",
          ),
          DefaultFormField(
            name: "patientCPF",
            label: "CPF do paciênte",
          ),
        ],
      ),
    );
  }
}
