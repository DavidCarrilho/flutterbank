import 'package:flutter/material.dart';

import '../design_system/colors/colors.dart';
import 'pages.dart';
import 'dart:developer' as developer;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8.0),
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
          Container(
            height: 100.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                const SizedBox(width: 8.0),
                _FeatureItemWidget(
                  name: 'Transferência',
                  icon: Icons.monetization_on,
                  onClick: () => _showContactsList(context),
                ),
                const SizedBox(width: 8.0),
                _FeatureItemWidget(
                    name: 'Histórico',
                    icon: Icons.description,
                    onClick: () => developer.log(
                          'Historico',
                        )),
                const SizedBox(width: 8.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void _showContactsList(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => ContactList(),
    ),
  );
}

class _FeatureItemWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;
  const _FeatureItemWidget({
    Key key,
    this.name,
    this.icon,
    @required this.onClick,
  }) : super(key: key);

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
