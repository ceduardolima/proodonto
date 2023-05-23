import 'package:flutter/material.dart';
import 'package:proodonto/app/shared/default_size.dart';

void loadingDialog(BuildContext context) {
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
