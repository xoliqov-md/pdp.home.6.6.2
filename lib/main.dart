import 'package:create/ApiService/api_service.dart';
import 'package:create/models/post_model.dart';
import 'package:create/models/response_post.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  RePost? user = null;

  void _apiPostUser(){
    Post post = Post(userId: 1, title: 'Azizbek', body: 'asdjhaskjdkgjgfadhj fshjdgfkhjsgfa');
    ApiService.POST(ApiService.GET_API, ApiService.paramsPost(post)).then((value) => {
      setState((){
        user = ApiService.parsePost(value!);
      })
    });
  }

  @override
  void initState() {
    _apiPostUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.blue,
        ),
        subtitle: Text(user?.body??'loading'),
        trailing: Text(user?.id??''),
        title: Text(
            user?.title??'loading',
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
