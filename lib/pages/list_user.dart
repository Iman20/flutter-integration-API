import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobcom_final_task/model/user_model.dart';
import 'package:mobcom_final_task/pages/detail_person.dart';
import 'package:mobcom_final_task/service/person_service.dart';

class ListUser extends StatefulWidget{
  static String tag = 'listuser-page';

  @override
  ListUserState createState() => new ListUserState();
}

class ListUserState extends State<ListUser>{
  callAPI(){
    createConnection().then((response){
      if(response.statusCode > 200)
        print(response.body);
      else
        print(response.statusCode);
    }).catchError((error){
      print('error : $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: new FutureBuilder<UserResponse>(
          future: getAllUsers(),
          builder: (context, snapshot){
            if(!snapshot.hasData)
              return new CircularProgressIndicator();
            
            return _buildList(snapshot.data, context);
          },
        ),
      )

    );

  }

  Widget _buildList(UserResponse user, BuildContext context){
    return ListView.builder(
      itemCount: user.results.length,
      itemBuilder: (BuildContext context, int position){
        return GestureDetector(
          onTap: (){
            print('tap at $position');
          },
          child: _buildListItem(user.results[position], context),
          );
      },
    );
  }
  
  Widget _buildListItem(Results user, BuildContext context){
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
                  image: NetworkImage(user.picture.large),
                  fit: BoxFit.cover,
                ),
              )),
            title: Text("${user.name.first}"),
            subtitle: Text("${user.email}"),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext contect) => DetailPerson(user)
                ));
            },
          ),
        ),
      ),
      );
  }
}