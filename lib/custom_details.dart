import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Choice.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDetails extends StatefulWidget {
  final String name;

  CustomDetails({Key key, @required this.name}) : super(key: key);

  @override
  _CustomDetailsState createState() => _CustomDetailsState();
}

class _CustomDetailsState extends State<CustomDetails> {
  Choice _selectedChoice = choices[0]; // The app's "state".
  final List<String> type = <String>[
    'Aapne Diya',
    'Aapne Diya',
    'Aapko Mila',
    'Aapko Mila',
    'Aapne Diya',
    'Aapne Diya',
    'Aapko Mila',
    'Aapko Mila'
  ];
  final List<int> amount = <int>[600, 500, 100, 600, 600, 500, 100, 600];
  final List<String> item = <String>[
    'Maal',
    'Maal',
    'Kaam',
    'Maal',
    'Maal',
    'Maal',
    'Kaam',
    'Maal'
  ];
  final List<String> stat = <String>[
    'Payment baki',
    'Payment baki',
    'Payment done',
    'Payment baki',
    'Payment baki',
    'Payment baki',
    'Payment done',
    'Payment baki'
  ];
  final gk = GlobalKey<ScaffoldState>();

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

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      final SnackBar snackBar = SnackBar(
        content: Text(choice.title),
      );
      gk.currentState.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: gk,

      //-------------APP BAR STARTS HERE----------------------
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey, size: 10),
          // leading: IconButton(
          //   color: Colors.redAccent,
          //   icon: Icon(
          //     Icons.arrow_back,
          //     color: Colors.grey,
          //     size: 26,
          //   ),
          //   onPressed: () {

          //   },
          // ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.phone,
                color: Colors.grey,
              ),
              onPressed: () async {
                if (await canLaunch("tel://" + "123456789")) {
                  await launch("tel://" + "123456789");
                } else {
                  throw 'Could not launch';
                }
              },
            ),
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
              itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          choice.icon,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4),
                        Text(choice.title)
                      ],
                    ),
                  );
                }).toList();
              },
              onSelected: _select,
            )
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Center(
                    child: Text(firstLetterWord(widget.name).toUpperCase())),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.lightBlueAccent),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    color: Colors.lightBlueAccent),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        widget.name,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Text(
                      '123456789',
                      style: TextStyle(color: Colors.grey[400], fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          )),

      //-------------APP BAR ENDS HERE----------------------

      //----------CARD ABOVE LIST BELOW APP BAR STARTS-------------

      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 0.75))
                ],
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 24, 8, 4),
                    child: Center(
                      child: Text(
                        'Aapko milna baaki hai',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
                    child: Center(
                      child: Text(
                        '200',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
                    child: Center(
                      child: Text(
                        'Ek entry banaya hai',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
                    child: Center(
                        child: SizedBox(
                      width: 225,
                      height: 45,
                      child: RaisedButton(
                        color: Colors.green,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Center(
                                  child: Icon(
                                Icons.notifications,
                                color: Colors.green,
                              )),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  color: Colors.white54),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Center(
                              child: Text(
                                'Name ko remind karein',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Agla reminder bajne ki date : 1st May')
                    ],
                  ),
                ],
              ),
            ),
            //
            //----------CARD ABOVE LIST BELOW APP BAR ENDS-------------

            // ------------------LIST VIEW STARTS-------------
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(2),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: type.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        borderOnForeground: true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '07',
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                  Text(
                                    'Apr',
                                    style: TextStyle(color: Colors.grey[700]),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  border: new Border.all(
                                      color: Colors.grey[300], width: 2),
                                  color: Colors.grey[200]),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          '${type[index]}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          '${amount[index]}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          '${item[index]}',
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(
                                          '${stat[index]}',
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),

            // ------------------LIST VIEW ENDS-------------

            //--------------- BOTTOM BUTTONS START -------------

            Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 0.75))
                ],
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Center(
                              child: Icon(
                            Icons.arrow_forward,
                            color: Colors.blue,
                          )),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              color: Colors.white54),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Center(
                          child: Text(
                            'Aapne Diya',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  RaisedButton(
                    color: Colors.green,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Center(
                              child: Icon(
                            Icons.arrow_back,
                            color: Colors.green,
                          )),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              color: Colors.white54),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Center(
                          child: Text(
                            'Aapko Mila',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),

      //--------------- BOTTOM BUTTONS END -------------
    );
  }
}
