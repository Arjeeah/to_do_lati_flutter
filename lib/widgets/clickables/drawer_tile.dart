import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_lati/providers/dark_mode_provider.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile(
      {super.key,
      required this.text,
      required this.ontap,
      required this.icon,
      this.withdrawer = true});
  final String text;
  final Function ontap;
  final IconData icon;
  final bool withdrawer;
  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeProvider>(builder: (context, darkMode, _) {
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              ontap();
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.deepPurple),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: darkMode.isDark ? Colors.white : Colors.black54,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                          color:
                              darkMode.isDark ? Colors.black87 : Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          if (withdrawer)
            const Divider(
              thickness: 1,
              endIndent: 5,
              indent: 5,
            )
        ],
      );
    });
  }
}
