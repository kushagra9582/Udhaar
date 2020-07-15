import 'dart:async';
import 'package:flutter/material.dart';
import 'package:udhar/dashboard.dart';
import 'package:udhar/widgets/search.dart';


class Reminder extends StatefulWidget {
  @override
  _ReminderState createState() => _ReminderState();
}
class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _ReminderState extends State<Reminder> {
  final _debouncer = Debouncer(milliseconds: 500);
  var _searchview = new TextEditingController();
  bool _firstSearch = true;
  String _query = "";
  List<String> _nebulae;
  List<String> _filterList;
  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    _nebulae = new List<String>();
    _nebulae = [
      "Meet Thakkar",
      "Mihir Poliwal",
      "Kushagra Bhardwaj",
      "Aakash Jha",
      "Sagar Poojary",
      "Vandan Sawamt",
      "Akshi Bhardwaj",
      "Pushkar BHardwaj"

    ];
    _filterList=_nebulae;
//    _nebulae.sort();
  }
//  _ReminderState(){
//
//    _searchview.addListener((){
//      if(_searchview.text.isEmpty){
//        setState(() {
//          _firstSearch=true;
//          _query=_searchview.text;
//        });
//      }
//
//    });
//  }


//  static const _popitem = <String>["Name", "Last Transaction", "Balance"];
//
//  List colors = [
//    Colors.redAccent,
//    Colors.greenAccent,
//    Colors.purpleAccent,
//    Colors.blueAccent,
//    Colors.orangeAccent
//  ];
//  Random random = new Random();
//
//  static List<PopupMenuItem<String>> _pop = _popitem
//      .map((String val) => PopupMenuItem<String>(
//            value: val,
//            child: Text(val),
//          ))
//      .toList();
//
//  String value;
//
//  List<String> litems = [
//    "Meet Thakkar",
//    "Mihir Poliwal",
//    "Khushagra Bharadwaj",
//    "Aakash Jha",
//    "Sagar Poojary",
//    "Vandan Sawamt"
//  ];
//
//  String firstLetterWord(String str) {
//    String result = "";
//
//    // Traverse the string.
//    bool v = true;
//    for (int i = 0; i < str.length; i++) {
//      // If it is space, set v as true.
//      if (str[i] == ' ')
//        v = true;
//
//      // Else check if v is true or not.
//      // If true, copy character in output
//      // string and set v as false.
//      else if (str[i] != ' ' && v == true) {
//        result += (str[i]);
//        v = false;
//      }
//    }
//
//    return result;
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height *
            0.09), // here the desired height
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: IconButton(
                  color: Colors.grey,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DashBoard()));
                  }),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              "Reminder bhejein",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      "(2) Sare selection hatae",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>
        [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Text(
              "Crear aapke party ko SMS reminder bhejega aur payment jaldi paane me aapki sahayta krega. Aap apne UPI setting yaha par kar sakte hai.",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
          Padding
            (
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Container
              (
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )),
              child:

              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15.0),
                  hintText: 'Filter by name',
                ),
                onChanged: (string) {
                  _debouncer.run(() {
                    setState(() {
                      _filterList = _nebulae;
                    });
                  });
                },
              ),
            ),),
          Flexible(child:ListView.builder(
            itemCount: _filterList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                trailing: Text(
                  "₹ 500",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: CircleAvatar(
                  child: Text(
                    firstLetterWord(_filterList[index]).toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.white,
                ),
                title: Text(
                  "${_filterList[index]}",
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

          ),




//          _createSearchView(),
//          _firstSearch? _createListView(): _performSearch(),



          Container(
            //color: Colors.grey,
            height: MediaQuery.of(context).size.height * 0.19,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        color: Colors.green[800],
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "REMINDER BHEJEIN",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                FlatButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.visibility,
                          color: Colors.green[800],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Reminder ka sample dekhein",
                          style: TextStyle(color: Colors.green[800]),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _createSearchView()
  {
    return new Padding
    (
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Container
      (
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )),
          child:

          TextFormField(
            controller: _searchview,
            decoration: InputDecoration(
                hintText: "Srearch Here"
            ),
      ),
    ),);
  }
//  Widget _createListView()
//  {
//    return new Flexible(child:ListView.builder(
//        itemCount: _nebulae.length,
//        itemBuilder: (context, index) {
//          return ListTile(
//            trailing: Text(
//              "₹ 500",
//              style: TextStyle(fontWeight: FontWeight.bold),
//            ),
//            leading: CircleAvatar(
//              child: Text(
//                firstLetterWord(_nebulae[index]).toUpperCase(),
//                style: TextStyle(color: Colors.white),
//              ),
//              backgroundColor: Colors.white,
//            ),
//            title: Text(
//              "${_nebulae[index]}",
//              style: TextStyle(
//                fontSize: 20,
//                color: Colors.black,
//              ),
//            ),
//            subtitle: Text(
//              "Paisa Dena Hai",
//              style: TextStyle(
//                color: Colors.black,
//              ),
//            ),
//          );
//        },
//      ),
//
//    );
//  }
//  Widget _performSearch()
//  {
//    _filterList= new List<String>();
//    for (int i=0;i<_nebulae.length;i++){
//      var item = _nebulae[i];
//      if(item.toLowerCase().contains(_query.toLowerCase())){
//        _filterList.add(item);
//      }
//    }
//    return _createFilteredListView();
//  }
//  Widget _createFilteredListView(){
//    return new  ListView.builder(
//        itemCount: _filterList.length,
//        itemBuilder: (context, index) {
//          return ListTile(
//            trailing: Text(
//              "₹ 500",
//              style: TextStyle(fontWeight: FontWeight.bold),
//            ),
//            leading: CircleAvatar(
//              child: Text(
//                firstLetterWord(_filterList[index]).toUpperCase(),
//                style: TextStyle(color: Colors.white),
//              ),
//              backgroundColor: Colors.white,
//            ),
//            title: Text(
//              "${_filterList[index]}",
//              style: TextStyle(
//                fontSize: 20,
//                color: Colors.black,
//              ),
//            ),
//            subtitle: Text(
//              "Paisa Dena Hai",
//              style: TextStyle(
//                color: Colors.black,
//              ),
//            ),
//          );
//        },
//
//    );
//  }

}
