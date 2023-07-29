import 'package:flutter/material.dart';
import 'package:proodonto/app/database/entity/patient.dart';

class PatientItem extends StatelessWidget {
  PatientItem({Key? key, required this.patient, required this.onTap})
      : super(key: key);
  Patient patient;
  Function(Patient) onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(patient),
      style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: Colors.white,
          shadowColor: Colors.black87,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        height: 110,
        child: Stack(
          children: [
            Positioned.fill(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _Text(text: patient.name!),
                _Text(text: "CPF - ${patient.cpf!}"),
                _Text(text: "N. Pront. - ${patient.recordNumber!}"),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
