import 'dart:io';
import 'package:android_intent/android_intent.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:udhar/widgets/bottom_sheet.dart';
import 'dart:math';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> _contacts;

  refreshContactsWithQuery(String query) async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      // Load without thumbnails initially.
      var contacts = (await ContactsService.getContacts(
              withThumbnails: false, query: '$query'))
          .toList();
//      var contacts = (await ContactsService.getContactsForPhone("8554964652"))
//          .toList();
      setState(() {
        _contacts = contacts;
      });
    } else {
      _handleInvalidPermissions(permissionStatus);
    }
  }

  List colors = [
    Colors.redAccent,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.blueAccent,
    Colors.orangeAccent
  ];
  Random random = new Random();

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String firstLetterWord(String str) {
    String result = "";

    if (isNumeric(str)) {
      return "#";
    }

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
  initState() {
    super.initState();
    refreshContacts();
  }

  refreshContacts() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      // Load without thumbnails initially.
      var contacts =
          (await ContactsService.getContacts(withThumbnails: false)).toList();
//      var contacts = (await ContactsService.getContactsForPhone("8554964652"))
//          .toList();
      setState(() {
        _contacts = contacts;
      });
    } else {
      _handleInvalidPermissions(permissionStatus);
    }
  }

  updateContact() async {
    Contact ninja = _contacts
        .toList()
        .firstWhere((contact) => contact.familyName.startsWith("Ninja"));
    ninja.avatar = null;
    await ContactsService.updateContact(ninja);

    refreshContacts();
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.contacts);
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.disabled) {
      Map<PermissionGroup, PermissionStatus> permissionStatus =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.contacts]);
      return permissionStatus[PermissionGroup.contacts] ??
          PermissionStatus.unknown;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      throw new PlatformException(
          code: "PERMISSION_DENIED",
          message: "Access to location data denied",
          details: null);
    } else if (permissionStatus == PermissionStatus.disabled) {
      throw new PlatformException(
          code: "PERMISSION_DISABLED",
          message: "Location data is not available on device",
          details: null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Customer Select Karein',
          style: TextStyle(color: Colors.black),
        ),
        // Positioned(
        //     top: 20, child: Text('Apne customer aur supplier select karein'))

        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(children: <Widget>[
        Expanded(
            flex: 0,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: inputDecoration3,
                  textInputAction: TextInputAction.search,
                  onChanged: (String s) {
                    refreshContactsWithQuery(s);
                  },
                ))),
        Expanded(
            flex: 0,
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                  child: GestureDetector(
                    onTap: () {
                      openAddContacts();
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.add,
                        color: Colors.green,
                      ),
                      title: Text(
                        'Manually add karein',
                        style: TextStyle(fontSize: 15, color: Colors.green),
                      ),
                      onTap: () {
                        NewCustomerSheet(context);
                      },
                    ),
                  )),
            )),
        Expanded(
          flex: 6,
          child: _contacts != null
              ? ListView.builder(
                  // separatorBuilder: (context, index) => Divider(
                  //   color: Colors.black,
                  // ),
                  itemCount: _contacts?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    Contact c = _contacts?.elementAt(index);
                    return Card(
                      elevation: 1.0,
                      child: ListTile(
                        onTap: () {
                          debugPrint('Name:');
                          debugPrint(c.displayName ?? "");
                          print(c.phones.first.value);
                        },
                        leading: CircleAvatar(
                          child: Text(
                            firstLetterWord(c.displayName).toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor:
                              colors[random.nextInt(colors.length)],
                        ),
                        title: Container(
                            child: Row(
                          children: <Widget>[
                            Flexible(
                              child: Text(c.displayName ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15.0)),
                            ),
                          ],
                        )),
                        trailing: Text(
                          '₹ 500',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                          ),
                        ),
                        //Divider(height:50,);
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        )
      ]),
    );
  }

  void openAddContacts() async {
    if (Platform.isAndroid) {
      final AndroidIntent intent = AndroidIntent(
        action: 'ContactsContract.Intents.Insert.ACTION',
        category: 'ContactsContract.RawContacts.CONTENT_TYPE',
      );
      await intent.launch();
    }
  }

  InputDecoration inputDecoration3 = InputDecoration(
    hintText: 'Search',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    fillColor: Colors.grey[200],
    filled: true,
    prefixIcon: Icon(
      Icons.search,
      color: Colors.grey,
    ),
  );
}
