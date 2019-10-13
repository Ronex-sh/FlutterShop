import 'package:flutter/material.dart';
import 'package:generalshop/api/authentication.dart';

void main (){
  runApp(GeneralShop());
}
class GeneralShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'General Shop',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Authentication authentication=Authentication();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('General Shop'),),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future:authentication.login('karrarmax124@gmail.com', 'password'),
            builder: (context,snapshot){
              return Center();
            },
          ),
        ),
      ),
    );
  }
}

