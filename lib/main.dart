import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tester/apis.dart';
import 'package:tester/users.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
         child: Column(
          children: [
             const Text(
                'Try out our one-time health packages below and pick the right one for you and your family.',
                textAlign: TextAlign.center,
              ),
               const Text(
                'Hello World',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),

              FutureBuilder<List<Users>>(
                future: getUserDetails(),
                builder: (context, AsyncSnapshot<List<Users>> snapshot){
                  if(snapshot.hasData && 
                  snapshot.connectionState == ConnectionState.done){
                   // print(snapshot.data!.first);
                    return Container(
                      
                      height: 500,
                      child: ListView.builder(
                        
                        itemCount: snapshot.data!.length,
                        
                        itemBuilder: (context, index){
                          Users users  = snapshot.data![index];
                          return Column(
                            children: [
                               Text(users.address.city ?? ''),
                                Text(users.name ?? ''),
                            ],
                          );
                         
                        }),
                    );
                  }else{
                     return Center(
                      
                        //replace this with a loading icon
                        child: new CircularProgressIndicator());
                  }
                })

          ],
         )
        ),
      ),
    );
  }
   Future<List<Users>> getUserDetails() async {
    List<Users> _users = await UsersApi().getUsers();
    return _users;
  }
}