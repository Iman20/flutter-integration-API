import 'package:flutter/material.dart';
import 'package:mobcom_final_task/pages/detail_person.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'package:mobcom_final_task/model/post_model.dart';
import 'package:mobcom_final_task/service/post_service.dart';

void main() => runApp(MyApp());

final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
  };

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      // title: 'Kodeversitas',
      // debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.lightBlue,
      //   fontFamily: 'Nunito',
      // ),
      // home: LoginPage(),
      // routes: routes,
    );
  }
}

class Home extends StatelessWidget{
  callAPI(){
    Post post = Post(body: 'Testing API', title: 'Mobcom B2');
    createPost(post).then((response){
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
      appBar: AppBar(),
      body: FutureBuilder<List<Post>>(future: getAllPosts(),
      builder: (context, snapshot){
        callAPI();
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return Text("Error");
          }

          return _buildList(snapshot.data, context);

          // return Text('Title from Post JSON : ${snapshot.data.title}');

        } else {
          return CircularProgressIndicator();
        }

      })
    );
  }

  Widget _buildList(List<Post> response, BuildContext context){
    return ListView.builder(
      itemCount: response.length,
      itemBuilder: (BuildContext context, int position){
        return GestureDetector(
          onTap: (){
            print('tap at $position');
          },
          child: _buildListItem(response[position], context),
        );
      },
    );
  }

  Widget _buildListItem(Post post, BuildContext context){

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey[800]),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: ListTile(
            title: Text("${post.title}"),
            subtitle: Text("${post.body}"),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: 
              (BuildContext context) => DetailPerson()
              ));
            }
          ),
        ),
      ),
    );
  }
}