import 'package:flutter/material.dart';
import 'package:proodonto/app/database/entity/patient.dart';

class PatientItem extends StatelessWidget {
  PatientItem({Key? key, required this.patient}) : super(key: key);
  Patient patient;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 100,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Nome: ${patient.name!}",
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "CPF: ${patient.cpf!}",
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                        ),),
                      Text(
                        "Prontuário: ${patient.recordNumber!}",
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                        ),),
                    ],
                  ),
                ))
          ],
        ),
    );
  }
}
