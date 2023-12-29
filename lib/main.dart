import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'home_page_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (context)=>AuthProvider()),
        ChangeNotifierProvider<HomePageProvider>(create: (context)=>HomePageProvider()),
        ChangeNotifierProvider<userDataProvider>(create:(context)=>userDataProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen ()
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Multi Provider"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: ListView(
          children: [
            Consumer<AuthProvider>(builder:(context,value,child)=>Text("${value.isLoggedIn}")),
            Consumer<userDataProvider>(builder:(context,value,child)=>Text(value.userName)),
            Consumer<HomePageProvider>(builder:(context,value,child)=>Text("${value.count}")),

            ElevatedButton(onPressed: (){
              Provider.of<AuthProvider>(context,listen: false).logIn();
              Provider.of<userDataProvider>(context,listen: false).setUserName("Priyanshu Ranjan");
              Provider.of<HomePageProvider>(context,listen: false).getData();
            }, child:const Text('Auth'))

          ],
        ),
      ),
    );
  }
}