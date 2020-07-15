import 'package:flutter/material.dart';
import 'package:udhar/dashboard.dart';
import 'dart:math';

class Pay extends StatefulWidget {
  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay>
{
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
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Partiyo ko payment karein",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            color: Colors.grey,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashBoard()));
            }),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 12, left: 15),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            //color: Colors.grey,
            child: Text(
              "Apne pasandeeda UPI app se (ex. Goolge Pay,Phonpee) apne party ko seedha aur muft me payment karein(zero charges)",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:40),

            height: MediaQuery.of(context).size.height*.5,
            child: new ListView.builder(
              itemCount: litems.length,
              itemBuilder: (context, index) {
                var item = litems[index];
                return ListTile(
                  trailing: Text(
                    "₹ 500",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: CircleAvatar(
                    child: Text(
                      firstLetterWord(litems[index]).toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: colors[random.nextInt(colors.length)],
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
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
