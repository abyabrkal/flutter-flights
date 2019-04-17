import 'package:flight_app/CustomShapeClipper.dart';
import 'package:flight_app/main.dart';
import 'package:flutter/material.dart';

final Color discountBackgroundColor = Color(0xFFFFE08D);
final Color flightBorderColor = Color(0xFFE6E6E6);
final Color chipBackgroundColor = Color(0xFFF6F6F6);

class FlightListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Search Results"),
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          )),
      body: Column(
        children: <Widget>[FlightListTopPart(), FlightListBottomPart()],
      ),
    );
  }
}

class FlightListTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [firstColor, secondColor]),
            ),
            height: 160,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.symmetric(horizontal: 16),
              elevation: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Dubai (DXB)',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 20,
                          ),
                          Text(
                            'New York City (JFK)',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.import_export,
                          color: Colors.black,
                          size: 30,
                        )),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class FlightListBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Best deals for next 6 months",
            style: dropDownMenuItemStyle,
          ),
          SizedBox(
            height: 8,
          ),
          FlightCard(),
        ],
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 16),
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: flightBorderColor,),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Text('${formatCurrency.format(4159)}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Text('${formatCurrency.format(9299)}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, decoration: TextDecoration.lineThrough, color: Colors.grey),),
                ],),
                Wrap()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
