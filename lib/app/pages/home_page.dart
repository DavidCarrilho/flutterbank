import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterbank/app/design_system/colors/colors.dart';

const _tituloApp = 'Trnsferências';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardWidget();
  }
}

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloApp),
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
                    colors: Colors.purple,
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
              width: 120.0,
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.person, size: 30.0, color: kColorNeutralPurple),
                  const SizedBox(height: 10.0),
                  Text(
                    'Contatos',
                    style: TextStyle(color: kColorNeutralPurple),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
