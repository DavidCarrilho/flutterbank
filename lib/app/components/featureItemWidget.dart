import 'package:flutter/material.dart';
import 'package:flutterbank/app/design_system/colors/colors.dart';

class FeatureItemWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;
  const FeatureItemWidget({
    Key key,
    this.name,
    this.icon,
    @required this.onClick,
  })  : assert(icon != null),
        assert(onClick != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: onClick,
          child: Container(
            width: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(icon, size: 30.0, color: kColorNeutralPurple),
                const SizedBox(height: 12.0),
                Text(
                  name,
                  style: TextStyle(color: kColorNeutralPurple),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
