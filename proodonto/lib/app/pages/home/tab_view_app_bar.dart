
import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/pages/home/seach_patient.dart';
import 'package:proodonto/app/services/auth_service.dart';
import 'package:proodonto/app/theme/colors.dart';
import 'package:provider/provider.dart';

class TabViewAppBar {
  static const _height = 60.0;
  static const _elevation = 5.0;
  static const _title = "Proodonto";
  static const _fontSize = 20.0;
  static const String _userIconPath = "assets/icons/user.png";

  static PreferredSizeWidget build({
    required BuildContext context,
    required ProodontoDatabase database,
    required List<Widget> tabList,
  }) {
    return AppBar(
      elevation: _elevation,
      toolbarHeight: _height,
      title: const Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Text(
          _title,
          style: TextStyle(fontSize: _fontSize),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 10),
          child: Row(
            children: [
              IconButton.outlined(
                onPressed: () {
                  showSearch(
                      context: context, delegate: SearchPatient(database));
                },
                icon: const Icon(Icons.search),
              ),
              IconButton.outlined(
                onPressed: () {
                  context.read<AuthService>().logout(context, database);
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
        )
      ],
      bottom: TabBar(
        tabs: tabList,
        indicatorColor: ProodontoColors.accent,
      ),
    );
  }
}