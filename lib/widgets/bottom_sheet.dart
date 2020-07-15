import 'package:flutter/material.dart';

void ModalBottomSheet(context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                  leading: new Icon(
                    Icons.call_made,
                    color: Colors.blue.shade400,
                  ),
                  title: new Text('You Gave  ₹'),
                  onTap: () => {}),
              new ListTile(
                leading: new Icon(
                  Icons.call_received,
                  color: Colors.green.shade400,
                ),
                title: new Text('You Got  ₹'),
                onTap: () => {},
              ),
            ],
          ),
        );
      });
}

void NewCustomerSheet(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (BuildContext bc) {
        return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      title: Center(
                          child: Text(
                    "Add New Customer",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ))),
                  new ListTile(
                      enabled: false,
                      leading: new Icon(
                        Icons.person,
                        color: Colors.blue.shade400,
                      ),
                      title: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Name',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: TextField(
                                autofocus: true,
                              ))
                            ],
                          ),
                        ],
                      ),
                      onTap: () => {}),
                  new ListTile(
                    enabled: false,
                    leading: new Icon(
                      Icons.phone,
                      color: Colors.green.shade400,
                    ),
                    title: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'Phone Number',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: TextField(
                              keyboardType: TextInputType.number,
                              autofocus: true,
                            ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 150.0, right: 0.0),
                              child: RaisedButton(
                                textColor: Colors.white,
                                color: Colors.green[800],
                                child: Text("Add"),
                                onPressed: () {},
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    onTap: () => {},
                  ),
                ],
              ),
            ));
      });
}
