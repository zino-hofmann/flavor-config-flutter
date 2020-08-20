import 'package:flutter/material.dart';

class DeviceInfoDialogTile extends StatelessWidget {
  final String name;
  final String value;

  DeviceInfoDialogTile({
    Key key,
    @required this.name,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value)
        ],
      ),
    );
  }
}
