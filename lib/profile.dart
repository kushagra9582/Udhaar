import 'package:flutter/material.dart';
import 'package:udhar/dashboard.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height.toDouble();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontSize: 25),
          textAlign: TextAlign.left,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
            color: Colors.grey,
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          //Expanded(child: )
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    right: 100.0,
                  ),
                  child: TextField(
                    //maxLength: 100,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        //labelText: "name"
                        hintText: "Kushagra Bhardwaj"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 100.0,
                  ),
                  child: TextField(
                    //maxLength: 10,
                    decoration: InputDecoration(
                        icon: Icon(Icons.call), hintText: "8667636894"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    "The above information might be shared with your parties",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          //HERE IS THE PROBLEM
          Align(
            alignment: Alignment.topRight,
            child: Container(
              // color: Colors.yellowAccent,
              // width: MediaQuery.of(context).size.width,
              // alignment: Alignment(0.99, -0.95),
              child: Padding(
                padding: const EdgeInsets.only(top: 25, right: 15),
                child: CircleAvatar(
                  backgroundColor: Colors.pinkAccent,
                  foregroundColor: Colors.white,
                  child: Text(
                    "MT",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  radius: 40,
                ),
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 150),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Divider(
                  thickness: 30,
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.work,
                    color: Colors.grey,
                  ),
                  title: Text("Business Details"),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 30),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.store,
                              color: Colors.grey,
                            ),
                            hintText: "Business Name"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 30),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.location_on,
                              color: Colors.grey,
                            ),
                            hintText: "Busines Address"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 30),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.shop,
                              color: Colors.grey,
                            ),
                            hintText: "Business Type"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 30),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.call,
                              color: Colors.grey,
                            ),
                            hintText: "Alternate Phone Number"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 30),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.business_center,
                              color: Colors.grey,
                            ),
                            hintText: "GSTIN Number"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "The above information will be shared in your reports.",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    )
                  ],
                ),
                Divider(
                  thickness: 10,
                ),
                ExpansionTile(
                  leading: Icon(Icons.payment, color: Colors.grey),
                  title: Text("Payment Details"),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 30),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.store,
                              color: Colors.grey,
                            ),
                            hintText: "UPI ID"),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 10,
                ),
                Container(
                  height: 150,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.picture_as_pdf,
                              color: Colors.grey,
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Yesterday's Report(Date)",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.cloud_download,
                              color: Colors.grey,
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Download account statement",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.backup,
                              color: Colors.grey,
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Backup Data",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 30,
                ),
                Container(
                  height: 100,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.settings,
                              color: Colors.grey,
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Language",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.notifications,
                              color: Colors.grey,
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Automatic Reminder",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 30,
                ),
                Container(
                  height: 100,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.question_answer,
                              color: Colors.grey,
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Frequently Asked Questions(FAQ)",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Contact Us",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 30,
                ),
                Container(
                  height: 60,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.share,
                              color: Colors.grey,
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Share App",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 30,
                ),
                Container(
                  height: 100,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.pages,
                              color: Colors.grey,
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Terms And Conditions",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.person_outline,
                              color: Colors.grey,
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Privacy Policy",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 30,
                ),
                Container(
                  height: 60,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.settings_power,
                              color: Colors.grey,
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 30,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
