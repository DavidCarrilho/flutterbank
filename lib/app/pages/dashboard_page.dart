import 'package:flutter/material.dart';

import '../components/components.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            width: double.infinity,
            color: kColorNeutralPurple,
            child: Column(
              children: <Widget>[
                const FlutterLogo(
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
                FeatureItemWidget(
                  name: 'Transferência',
                  icon: Icons.monetization_on,
                  onClick: () =>
                      _navigation(context: context, page: ContactsList()),
                ),
                const SizedBox(width: 8.0),
                FeatureItemWidget(
                  name: 'Histórico',
                  icon: Icons.description,
                  onClick: () =>
                      _navigation(context: context, page: TransactionsList()),
                ),
                const SizedBox(width: 8.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void _navigation({BuildContext context, Widget page}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}
