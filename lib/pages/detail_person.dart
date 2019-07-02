import 'package:flutter/material.dart';
import 'package:mobcom_final_task/model/user_model.dart';

class DetailPerson extends StatefulWidget {
  static String tag = 'detail-page';
  final Results user;

  DetailPerson(this.user);

  @override
  _DetailPersonState createState() => new _DetailPersonState();
}

class _DetailPersonState extends State<DetailPerson>{

final _namaDepan = TextEditingController();
final _namaBelakang = TextEditingController();
final _alamat = TextEditingController();
final _ttl = TextEditingController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _namaDepan.text = widget.user.name.first;
    _namaBelakang.text = widget.user.name.last;
    _alamat.text = widget.user.location.street;
    _ttl.text = widget.user.dob.date.toString();
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
                    image: NetworkImage(widget.user.picture.large),
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
              controller: _namaBelakang,
              decoration: InputDecoration(
                labelText: "Nama Belakang",
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

        ],
      ),
    );
    
  }

}