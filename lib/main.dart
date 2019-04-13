import 'package:flight_app/CustomShapeClipper.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'Flight Listings',
  debugShowCheckedModeBanner: false,
  home: HomeScreen(),
  theme: appTheme,
));

Color firstColor = Color(0xfff47d15);
Color secondColor = Color(0xffef772c);

ThemeData appTheme = ThemeData(
  primaryColor: Color(0xfff3791a),
  fontFamily: 'Oxygen',
);

List<String> locations = ['Dubai (DXB)', 'New York City (NYK)'];

const TextStyle dropDownLabelStyle = TextStyle(color: Colors.white, fontSize: 16);
const TextStyle dropDownMenuItemStyle = TextStyle(color: Colors.black, fontSize: 16);

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HomeScreenTopPart()
        ],
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {

  var selectedLocationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400,
            // color: Colors.orange,
            decoration: BoxDecoration(gradient: LinearGradient(colors: [firstColor, secondColor])),
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_on, color: Colors.white,),
                      SizedBox(width: 16),
                      PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            selectedLocationIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(locations[selectedLocationIndex], style: dropDownLabelStyle,),
                            Icon(Icons.keyboard_arrow_down, color: Colors.white,)
                          ],
                        ),
                        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                          PopupMenuItem(
                            child: Text(locations[0], style: dropDownMenuItemStyle,),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: Text(locations[1], style: dropDownMenuItemStyle,),
                            value: 1,
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.settings, color: Colors.white),
                    ],
                  ),
                )
              ],
            ),
          ), 
        )
      ],
    );
  }
}

