import 'package:flutter/material.dart';
import 'package:udhar/custom_details.dart';
import 'package:udhar/pay.dart';
import 'package:udhar/profile.dart';
import 'package:udhar/widgets/bottom_sheet.dart';
import 'package:udhar/widgets/search.dart';
import 'dart:math';
import 'contact_list.dart';
import 'pay.dart';
import 'reminder.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  static const _popitem = <String>["Name", "Last Transaction", "Balance"];

  List colors = [
    Colors.redAccent,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.blueAccent,
    Colors.orangeAccent
  ];
  Random random = new Random();

  static List<PopupMenuItem<String>> _pop = _popitem
      .map((String val) => PopupMenuItem<String>(
            value: val,
            child: Text(val),
          ))
      .toList();

  String value;

  List<String> litems = [
    "Meet Thakkar",
    "Mihir Poliwal",
    "Khushagra Bharadwaj",
    "Aakash Jha",
    "Sagar Poojary",
    "Vandan Sawamt"
  ];

  String firstLetterWord(String str) {
    String result = "";

    // Traverse the string.
    bool v = true;
    for (int i = 0; i < str.length; i++) {
      // If it is space, set v as true.
      if (str[i] == ' ')
        v = true;

      // Else check if v is true or not.
      // If true, copy character in output
      // string and set v as false.
      else if (str[i] != ' ' && v == true) {
        result += (str[i]);
        v = false;
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: Center(
          child: Text(
            "Udhaar",
            style: TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.contact_mail),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              );
            },
            color: Colors.grey,
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
            color: Colors.grey,
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  height: 50,
                  child: Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "₹ 500",
                                style: TextStyle(
                                    color: Colors.green[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                            ),
                            Text(
                              "Amount milna hai",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: ((MediaQuery.of(context).size.width / 2.5) / 2)
                              .toDouble(),
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "₹ 500",
                                style: TextStyle(
                                    color: Colors.blue[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                            ),
                            Text(
                              "Amount pay karna hai",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Column(
                    //   children: <Widget>[
                    //     Padding(
                    //       padding: const EdgeInsets.all(5.0),
                    //       child: Text(
                    //         "₹ 500",
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.bold, fontSize: 30),
                    //       ),
                    //     ),
                    //     Text(
                    //       "Amount milna hai",
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(fontWeight: FontWeight.bold),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          // alignment: Alignment(0.0, 0.0),
                          decoration: BoxDecoration(
                              color: Colors.green[800],
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.0),
                                topLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0),
                              )),
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width / 2.5,
                          //color: Colors.black,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,

                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 19,
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Pay()));
                                    },
                                    child: Text(
                                      "Collect Karein",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              29,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          alignment: Alignment(0.0, 0.0),
                          decoration: BoxDecoration(
                              color: Colors.blue[800],
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.0),
                                topLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0),
                              )),
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width / 2.5,
                          //color: Colors.black,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,

                            children: <Widget>[
                              Center(
                                child: Container(
                                  height: 19,
                                  child: FlatButton(onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Reminder()));}, child:Text(
                                    "Payment Karein",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                29,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Aur jaankari paayein  "),
                        Icon(
                          Icons.info_outline,
                          size: 12,
                          color: Colors.green[800],
                        ),
                      ],
                    ),
                    Divider(height: 25, thickness: 1, color: Colors.black),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContactList(),
                              ),
                            );
                          },
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.person_add),
                                color: Colors.green[800],
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ContactList(),
                                    ),
                                  );
                                },
                              ),
                              Text(
                                "Naya Customer add kro",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[800]),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Flexible(
                          child: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      searchList(litems: litems),
                                ),
                              );
                              ;
                            },
                            color: Colors.grey,
                          ),
                        ),
                        PopupMenuButton(
                          tooltip: "Sort",
                          itemBuilder: (BuildContext context) => _pop,
                          icon: Icon(
                            Icons.filter_list,
                            color: Colors.grey,
                          ),
                          onSelected: (String val) {
                            value = val;
                            if (value == "Name") {
                              setState(() {
                                litems.sort();
                              });
                            }
                          },
                          // color: Colors.grey,
                        ),
                      ],
                    ),
                    Flexible(
                      child: new ListView.builder(
                        itemCount: litems.length,
                        itemBuilder: (context, index) {
                          var item = litems[index];
                          return Card(
                            child: ListTile(
                              trailing: Text(
                                "₹ 500",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              leading: CircleAvatar(
                                child: Text(
                                  firstLetterWord(litems[index]).toUpperCase(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor:
                                    colors[random.nextInt(colors.length)],
                              ),
                              title: Text(
                                "${litems[index]}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                "Paisa Dena Hai",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              onTap: () {
                                print(litems[index]);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CustomDetails(name: litems[index]),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    )
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ModalBottomSheet(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green[800],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
