import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(title: "Contador de pessoas",
    home: Home()));
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _people = 0;
  String _mensage = "Pode entrar";
  void _changePeople(int delta) {
    setState(() {
      _people += delta;
      if(_people >= 20){
        _mensage = "Lotado, não pode entrar";
        _people = 20;
      } 
      else if(_people < 0){
        _mensage = "Pode entrar";
        _people = 0;
      } 
      else{
        _mensage = "Pode entrar";
      }
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "Images/floresta.jfif",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold), 
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      child: const Text(
                        "+1",
                        style: TextStyle(fontSize: 40.0,
                        color: Colors.white),
                      ),
                      onPressed: () {
                        _changePeople(1);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      child: const Text(
                        "-1",
                        style: TextStyle(fontSize: 40.0,
                        color: Colors.white),
                      ),
                      onPressed: () {
                        _changePeople(-1);
                      },
                    ),
                  ),
                ],
              ),
              Text(
              _mensage,
              style: const TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30),
            ) 
          ],
        )
      ],
    );
  }
}

