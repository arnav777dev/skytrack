import 'dart:math';
import 'package:flutter/material.dart';
import 'package:skytrack/activities/location.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:quotes_widget/quotes_widget.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController search = new TextEditingController();
  late Map<String, dynamic> currData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  }



  @override
  Widget build(BuildContext context) {
    String greet = "";
    int morning = 0;
    final currentTime = DateTime.now().hour;
    if (currentTime >= 5 && currentTime < 12) {
      greet = "Good Morning, SkyTracker";
      morning = 0;
    } else if (currentTime >= 12 && currentTime < 17) {
      greet = "Good Afternoon, SkyTracker";
      morning = 1;
    } else {
      greet = "Good Evening, SkyTracker";
      morning = 2;
    }
    String pic = "";
    if(morning == 0){
      pic = "assets/images/morning.png";
    }
    else if(morning == 1){
      pic = "assets/images/afternoon.jpg";
    }
    else pic = "assets/images/night-wall.jpg";
    var city = [
      "Delhi",
      "Gurugram",
      "Mumbai",
      "Hyderabad",
      "Pune",
      "Bangalore",
      "Noida",
      "Indore",
      "Greater Noida",
      "NYC",
      "London",
      "Kolkata",
      "Ahmedabad",
      "Kanpur",
      "Varanasi",
      "Lucknow",
      "Meerut",
      "Muzaffarnagar"
    ];
    final rand = new Random();
    var randcity = city[rand.nextInt(city.length)];
    // print(currData["temp"]);
    String id = currData["id"];
    // if(currData["desc"] == "-"){
    //   // Navigator.pushNamed(context, "/locations");
    // }
    return Scaffold(
     

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue,
        ),
      ),

      body: SingleChildScrollView(

        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(pic)),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade500, Colors.blue.shade200])),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 8,
              ),

              //top name and logo
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    "assets/images/logo1.png",
                    scale: 4,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "SkyTrack",
                    style: TextStyle(fontFamily: 'caveat', fontSize: 30,color: Colors.white),
                  ),
                ],
              ),
              //sesarch container
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.blue,
                        )),
                    Expanded(
                      child: TextField(
                        controller: search,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search $randcity"),
                        onSubmitted: (String value) {
                          // print(search.text);
                          // Navigate to the LocationPage with the searched city
                          Navigator.pushNamed(
                            context,
                            "/loading",
                            arguments: [
                              search.text,
                            ]
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              //greeting row
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(greet,style: TextStyle(fontSize: 30,color: Colors.white,fontFamily: "caveat"),),
                  ],
                ),
              ),
              // quote container
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 200,
                child: QuotesWidget(

                  width: 350,
                  height: 200,
                  quoteFontSize: 21,
                  authorFontSize: 18,
                ),
              ),
              // description container
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 100,

                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    border: Border.all(
                        color: Colors.black,
                        width: 0.5,
                        style: BorderStyle.solid
                    ),
                  // gradient: LinearGradient(
                  //     begin: Alignment.bottomLeft,
                  //     end: Alignment.topRight,
                  //     colors: [
                  //       Colors.white,
                  //       Colors.blueGrey
                  //     ]
                  // ),
                    borderRadius: BorderRadius.circular(20)),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network('http://openweathermap.org/img/w/$id.png',scale: 0.4,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(currData["desc"] ,style: TextStyle(fontSize: 35,fontFamily: "baca"),),
                        Text( currData["name"],style: TextStyle(fontSize: 30,fontFamily: "baca"),)
                      ],
                    )
                  ],
                ),
              ),
              //temp container
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                    border: Border.all(
                        color: Colors.black,
                        width: 0.5,
                        style: BorderStyle.solid
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //main tmep row
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(

                                  margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                                  child: Icon(
                                    Icons.thermostat_outlined,
                                    size: 80,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                          // SizedBox(
                          //   width: 90,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    currData["temp"] + "\u00b0" + " C",
                                    style: TextStyle(
                                        fontSize: 50, color: Colors.black),
                                  ),
                                  Text(
                                    "Feels like " +
                                        currData["feel_like"] +
                                        "\u00b0" + " C",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,fontFamily: "baca"),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    //min max
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              currData["temp_min"] + "\u00b0" + " C",
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              "Min",
                              style: TextStyle(fontSize: 20,fontFamily: "baca"),
                            ),
                          ],
                        ),
                        SizedBox(width: 100,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              currData["temp_max"] + "\u00b0" + " C",
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              "Max",
                              style: TextStyle(fontSize: 20,fontFamily: "baca"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //humidity air speed
              Row(
                children: [
                  //wnd apeed
                  Expanded(
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid
                          ),
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          //icon wali row
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                Icons.air_sharp,
                                size: 40,
                              ),
                            ],
                          ),
                          //data wali row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                currData["air_speed"],
                                style: TextStyle(fontSize: 35),
                              )
                            ],
                          ),
                          //unit wali row
                          SizedBox(
                            height: 6,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "KM/H",
                                  style: TextStyle(fontSize: 15,fontFamily: "baca",fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //humidity
                  Expanded(
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid
                          ),
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          //icon wali row
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                Icons.water_drop_sharp,
                                size: 40,
                              ),
                            ],
                          ),
                          //data wali row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(width: 65,),
                              Text(
                                currData["humidity"],
                                style: TextStyle(fontSize: 35),
                              )
                            ],
                          ),
                          //unit wali row
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "%",
                                  style: TextStyle(fontSize: 23,fontFamily: "baca",fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //sunrise sunset row
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid
                          ),
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          //icon wali row
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                WeatherIcons.sunrise,
                                size: 40,
                              ),
                            ],
                          ),
                          //data wali row
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                currData["sunrise"],
                                style: TextStyle(fontSize: 30),
                              )
                            ],
                          ),
                          //unit wali row
                          SizedBox(
                            height: 6,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 110,
                                ),
                                Text(
                                  "AM",
                                  style: TextStyle(fontSize: 15,fontFamily: "baca",fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid
                          ),

                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          //icon wali row
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                WeatherIcons.sunset,
                                size: 40,
                              ),
                            ],
                          ),
                          //data wali row
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                currData["sunset"],
                                style: TextStyle(fontSize: 30),
                              )
                            ],
                          ),
                          //unit wali row
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 115,
                                ),
                                Text(
                                  "PM",
                                  style: TextStyle(fontSize: 15,fontFamily: "baca",fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Text("Data by: OpenWeatherMap.",style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}
