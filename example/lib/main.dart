import 'package:flutter/material.dart';
import 'package:floating_ribbon/floating_ribbon.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _hotels = [
    'Samudra Hotel',
    'Naivedyam',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Floating Ribbon Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  'clipper = Clipper.right',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                restaurantListTile(_hotels.elementAt(0), true),
                restaurantListTile(_hotels.elementAt(1), true),
              ],
            ),
            Container(
              color: Colors.white,
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  'clipper = Clipper.equilateral',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                restaurantListTile(_hotels.elementAt(0), false),
                restaurantListTile(_hotels.elementAt(1), false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget restaurantListTile(String hotel, bool isRight) {
    double width = MediaQuery.of(context).size.width;
    width = width * 0.30;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        color: Colors.white70,
      ),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FloatingRibbon(
              height: 85,
              width: 85,
              childHeight: 75,
              childWidth: 75,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlutterLogo(),
              ),
              childDecoration: BoxDecoration(color: Colors.grey),
              ribbon: Center(
                child: Text(
                  'Exclusive',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              clipper: isRight ? Clipper.right : Clipper.equilateral,
              equilateralTriangleWidth: isRight ? null : 5,
              shadowHeight: 7,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, bottom: 5.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      hotel,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Avenir-Bold',
                      ),
                      maxLines: 3,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Icon(Icons.access_alarms,
                            color: Colors.black54, size: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.5),
                        child: Text(
                          "30 min",
                          style: TextStyle(
                            color: Colors.black45,
                            fontFamily: 'Avenir-Black',
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5.0,
                          right: 5.0,
                          top: 3.0,
                        ),
                        child: Icon(
                          Icons.fiber_manual_record,
                          color: Colors.black54,
                          size: 8.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.5),
                        child: Text(
                          'Open',
                          style: TextStyle(
                            color: Colors.green,
                            fontFamily: 'Avenir-Black',
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5.0, right: 5.0, top: 3.0),
                        child: Icon(Icons.fiber_manual_record,
                            color: Colors.black54, size: 8.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text(
                          '\$\$',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
