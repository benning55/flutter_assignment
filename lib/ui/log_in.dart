import 'package:flutter/material.dart';
import '../main.dart';
import 'sign_up.dart';


class LogInPage extends StatefulWidget{

  final String email;
  final String password;

  LogInPage({Key key, this.email, this.password}) :super (key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LogInState();
  }
  
}

class SingIn extends StatefulWidget{
  @override
  LogInState createState() => LogInState();
}

class LogInState extends State<LogInPage>{
  
  final _formKey = GlobalKey<FormState>();
  final _emailControl = TextEditingController();
  final _passwordControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log in"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Image.asset(
              "resources/1.png",
              height: 100
            ),
            TextFormField(
              controller: _emailControl,
              decoration: InputDecoration(
                labelText: "USERNAME",
                hintText: "Please enter your username.",
                icon: Icon(Icons.person)
              ),
              keyboardType: TextInputType.text,
              obscureText: false,
              validator: (value){}
            ),
            TextFormField(
              controller: _passwordControl,
              decoration: InputDecoration(
                labelText: "PASSWORD",
                hintText: "Please enter your password.",
                icon: Icon(Icons.https)
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (value){}
            ),
            RaisedButton(
              child: Text("LOGIN"),
              onPressed: (){
                _formKey.currentState.validate();
                if(_emailControl.text.isEmpty || _passwordControl.text.isEmpty){
                  showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: new Text("Error!"),
                        content: new Text("กรุณาระบุ user or password"),
                        actions: <Widget>[
                          new FlatButton(
                            child: new Text("close"),
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    }
                  );
                }
                else if(_emailControl.text == 'admin' || _passwordControl.text == 'admin'){
                  showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: new Text("Error!"),
                        content: new Text("user or password ไม่ถูกต้อง"),
                        actions: <Widget>[
                          new FlatButton(
                            child: new Text("close"),
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    }
                  );
                }
                else if("${widget.email}" == _emailControl.text && "${widget.password}" == _passwordControl.text){
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context) => MyMain()));
                }else if(("${widget.email}" != _emailControl.text || "${widget.password}" != _passwordControl.text)) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: new Text("Error!"),
                        content: new Text("ไม่มีชื่อผู้ใช้นี้ในระบบ"),
                        actions: <Widget>[
                          new FlatButton(
                            child: new Text("close"),
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    }
                  );
                }
              },
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: Text(
                "Register New Account",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue
                ),
                textAlign: TextAlign.right
              ),
            )
          ],
        ),
      ),
    );
  }
  
}
