import 'package:flutter/material.dart';

import '../design_system/colors/colors.dart';
import 'pages.dart';

const _appTitle = 'Trnsferências';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appTitle),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              width: double.infinity,
              color: kColorNeutralPurple,
              child: Column(
                children: <Widget>[
                  FlutterLogo(
                    size: 180.0,
                    colors: Colors.deepPurple,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'FlutterBank',
                    style: TextStyle(
                      color: kColorDeepPurple,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                _FeatureItemWidget(
                  name: 'Transferência',
                  icon: Icons.monetization_on,
                  onClick: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ContactList(),
                        ),
                      ),
                ),
                const SizedBox(width: 8.0),
                _FeatureItemWidget(
                  name: 'Histórico',
                  icon: Icons.description,
                  onClick: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ContactList(),
                        ),
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _FeatureItemWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;
  const _FeatureItemWidget({
    Key key,
    this.name,
    this.icon,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: onClick,
        child: Container(
          height: 100.0,
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
    );
  }
}
