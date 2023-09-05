import 'package:flutter/material.dart';
import 'package:proodonto/app/database/entity/patient.dart';

class PatientItem extends StatefulWidget {
  PatientItem(
      {Key? key,
      required this.patient,
      required this.onTap,
      this.onTapFavoriteButton})
      : super(key: key) {
    _favorite = patient.isFavorite!;
  }

  Patient patient;
  Function(Patient) onTap;
  final Function()? onTapFavoriteButton;
  late bool _favorite;

  @override
  State<PatientItem> createState() => _PatientItemState();
}

class _PatientItemState extends State<PatientItem> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => widget.onTap(widget.patient),
      style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: Colors.white,
          shadowColor: Colors.black87,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      child: Container(
        height: 110,
        child: Stack(
          children: [
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _Text(text: widget.patient.name!),
                        //_Text(text: "CPF - ${widget.patient.cpf!}"),
                        _Text(
                            text:
                                "N. Pront. - ${widget.patient.recordNumber!}"),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() => widget._favorite = !widget._favorite);
                      if(widget.onTapFavoriteButton != null) {
                        widget.onTapFavoriteButton!();
                      }
                    },
                    icon: Icon(
                      widget._favorite
                          ? Icons.star_outlined
                          : Icons.star_border,
                      color: widget._favorite
                          ? Colors.yellow[600]
                          : Colors.grey,
                    ),
                  )
                ],
              ),
            ),
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
