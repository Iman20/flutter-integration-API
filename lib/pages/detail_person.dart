import 'package:flutter/material.dart';
import 'package:mobcom_final_task/model/user_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mobcom_final_task/pages/tab_home.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class DetailPerson extends StatefulWidget {
  static String tag = 'detail-page';
  final Users user;
  final String directFrom;


  DetailPerson(this.user, this.directFrom);

  @override
  _DetailPersonState createState() => new _DetailPersonState();
}

class _DetailPersonState extends State<DetailPerson>{

final database = FirebaseDatabase.instance.reference();

final _namaDepan = TextEditingController();
final _email = TextEditingController();
final _alamat = TextEditingController();
final _ttl = TextEditingController();
FlutterLocalNotificationsPlugin localNotif;

@override
  void initState() {
    super.initState();
    _namaDepan.text = widget.user.name;
    _email.text = widget.user.email;
    _alamat.text = widget.user.address;
    _ttl.text = widget.user.dob;
    var androidSettingsNotification = AndroidInitializationSettings('@mipmap/ic_launcher.png');
    var iosSettingsNotification = IOSInitializationSettings();
    var notificationSettings = InitializationSettings(androidSettingsNotification, iosSettingsNotification);
    localNotif = FlutterLocalNotificationsPlugin();
    localNotif.initialize(notificationSettings, onSelectNotification: onSelectNotification);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Personals"),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 24.0)),
              Center(
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(widget.user.picture),
                    fit: BoxFit.cover,
                  ),
                )
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 24.0)),
            TextFormField(
              controller: _namaDepan,
              decoration: InputDecoration(
                labelText: "Nama Depan",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0))
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),

            Padding(padding: EdgeInsets.only(top: 24.0)),
            TextFormField(
              controller: _email,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0))
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),

            Padding(padding: EdgeInsets.only(top: 24.0)),
            TextFormField(
              controller: _alamat,
              decoration: InputDecoration(
                labelText: "Alamat",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0))
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),

            Padding(padding: EdgeInsets.only(top: 24.0)),
            TextFormField(
              controller: _ttl,
              decoration: InputDecoration(
                labelText: "Tempat Tanggal Lahir",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0))
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),

             Padding(padding: EdgeInsets.only(top: 24.0),),
             RaisedButton(
                child: Text(widget.directFrom),
                  onPressed: (){
                    if(widget.directFrom == 'Save'){
                      saveToFirebase(widget.user);
                    } else {
                      deleteData(widget.user.email);
                    }
                    _showNotification(widget.user.name, 'Sukses adding');
                    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: 
                    //     (context) => TabHome()
                    //   ));
                  },
              ), 



           
           


        ],
      ),
    );
    
  }

  void saveToFirebase(Users users){
    database.child(users.email.replaceAll(".", "")).set(users.toJson);
  }

  void deleteData(String id){
    database.child(id.replaceAll(".", "")).remove();
  }

  void sendNotification(){
  }

  Future onSelectNotification(String payload) async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: 
      (context) => TabHome()
    ));
  }

  Future _showNotification(String title, String message) async {
    var appName = 'mobcom_final_task';

    var packageName = 'mobcom_final_task';

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      packageName ?? "channel_id", appName, 'Notification',
      importance: Importance.Max, priority: Priority.High
    );

    var iosPlatformChannelSpecifics = IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics, iosPlatformChannelSpecifics
    );

    await localNotif.show(0, title, message, platformChannelSpecifics, 
      payload: 'Default_Sound');
}

}