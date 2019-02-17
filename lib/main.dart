import 'package:flutter/material.dart';
import './ui/log_in.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Assingment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: LogInPage()
    );
  }

}

  


class MyMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyMainState();
  }
  
}



class MyMainState extends State<MyMain> {
  int _selectPage = 0;
  final _pageOptions = [
    Text("Home", style: TextStyle(fontSize: 50.0)),
    Text("Notify", style: TextStyle(fontSize: 50.0)),
    Text("Map", style: TextStyle(fontSize: 50.0)),
    Text("Profile", style: TextStyle(fontSize: 50.0)),
    Text("Setup", style: TextStyle(fontSize: 50.0))
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("HOME"),centerTitle: true
        ),
        body: Center(
          child: _pageOptions[_selectPage],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectPage,
          onTap: (int index){
            setState(() {
              _selectPage = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              title: Text('', style: TextStyle(height: 0.0),)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('', style: TextStyle(height: 0.0),)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text('', style: TextStyle(height: 0.0),)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('', style: TextStyle(height: 0.0),)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('', style: TextStyle(height: 0.0),)
            ) 
          ]
        )
      )
    );
  }
}



