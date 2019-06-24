import 'package:flutter/material.dart';

class DetailPerson extends StatefulWidget {
  static String tag = 'detail-page';
  @override
  _DetailPersonState createState() => new _DetailPersonState();
}

class _DetailPersonState extends State<DetailPerson>{

final _namaDepan = TextEditingController();
final _namaBelakang = TextEditingController();
final _alamat = TextEditingController();
final _ttl = TextEditingController();

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
            Hero(tag: 'Hero',
              child: CircleAvatar(backgroundColor: Colors.transparent,
              radius: 48.0,
              child: Image.asset('assets/logo.png')
              ,)
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