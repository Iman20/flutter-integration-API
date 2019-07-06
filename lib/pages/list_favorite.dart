import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mobcom_final_task/model/user_model.dart';
import 'package:mobcom_final_task/pages/detail_person.dart';

class ListFavorite extends StatefulWidget{
  static String tag = 'listfavorite-page';

  @override
  ListFavoriteState createState() => new ListFavoriteState();

}

class ListFavoriteState extends State<ListFavorite>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: StreamBuilder(
          stream: FirebaseDatabase.instance.reference().onValue,
          builder: (context, snapshot){
            print("========MASUK");
            if(snapshot.hasData){
              print(snapshot.data.snapshot.value);
              var lists = new List<Users>();
              Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
              print(map);
              map.forEach((dynamic, v) {
                var users = new Users(
                gender: v["gender"],
                name: v["name"],
                address: v["address"],
                email: v["email"],
                dob: v["dob"],
                phone: v["phone"],
                picture: v["picture"]
                );
                lists.add(users);
              });

              return _buildList(lists, context);

            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )
      ),
    );
  }

   Widget _buildList(List<Users> user, BuildContext context){
    return ListView.builder(
      itemCount: user.length,
      itemBuilder: (BuildContext context, int position){
        return GestureDetector(
          onTap: (){
            print('tap at $position');
          },
          child: _buildListItem(user[position], context),
          );
      },
    );
  }
  
  Widget _buildListItem(Users user, BuildContext context){
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey[800]),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: ListTile(
            leading: Container(
              width: 60.0,
              height: 60.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  image: NetworkImage(user.picture),
                  fit: BoxFit.cover,
                ),
              )),
            title: Text("${user.name}"),
            subtitle: Text("${user.email}"),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext contect) => DetailPerson(user, 'Remove')
                ));
            },
          ),
        ),
      ),
      );
  }
}