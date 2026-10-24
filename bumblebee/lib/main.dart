import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'carMenu.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/carMenu', builder: (context, state) => const CarMenu()),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        brightness: Brightness.dark,
      ),
      routerConfig: router,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bumblee: Car Rental App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: Icon(Icons.directions_car),
            ),
            SizedBox(height: 20),
            Text(
              "Rent your car with ease",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next screen
              },
              child: Text("Car Menu"),
            ),
            ElevatedButton(
              onPressed: () {
                context.go(
                  '/carMenu',
                ); // Navigate to the CarMenu screen using GoRouter
                // Navigate to the next screen
              },
              child: Text("Car Menu"),
            ),
          ],
        ),
      ),
    );
  }
}

class Signupscreen extends StatelessWidget{
  const Signupscreen({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold
    (appBar: AppBar(title: const Text('Create your profile')),
    body: SafeArea(
      child:Padding(padding: const EdgeInsetsGeometry.all(16)),
      child: Form() 
    ,)
    
  }

}
class Vaidators{
  static String? validateName(?String value){
    if value == Null
  }
}