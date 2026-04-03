import 'package:flutter/material.dart';

class RowSettingWidget extends StatelessWidget {
  String text;
  IconData icon;
  void Function()? onTap;
  RowSettingWidget({required this.text, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            child: Row(
              children: [
                Icon(
                  icon,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(
                  flex: 1,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Divider(
            endIndent: 40,
            indent: 40,
          )
        ],
      ),
    );
  }
}
