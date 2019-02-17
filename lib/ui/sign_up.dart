import 'package:flutter/material.dart';
import 'log_in.dart';

class SignUpPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignUpState();
  }
}

class SingUp extends StatefulWidget{
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUpPage>{

  final _formState = GlobalKey<FormState>();
  final _emailControl = TextEditingController();
  final _passwordControl =TextEditingController();
  final _re_passwordControl =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _formState,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _emailControl,
                decoration: InputDecoration(
                labelText: "EMAIL",
                hintText: "Please enter your email.",
                icon: Icon(Icons.email)
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
              TextFormField(
                controller: _re_passwordControl,
                decoration: InputDecoration(
                labelText: "RE-PASSWORD",
                hintText: "Please re-enter your password.",
                icon: Icon(Icons.https)
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (value){}
              ),
              RaisedButton(
                child: Text("CONTINUE"),
                onPressed: (){
                  _formState.currentState.validate();
                  if(_emailControl.text.isEmpty || _passwordControl.text.isEmpty || _re_passwordControl.text.isEmpty){
                    showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: new Text("Error!"),
                        content: new Text("กรุณาระบุข้อมูลให้ครบถ้วน"),
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
                  else if(_emailControl.text == 'admmin' || _passwordControl.text == 'admin' || _re_passwordControl.text == 'admin'){
                    showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: new Text("Error!"),
                        content: new Text("user นี้อยู่ในระบบแล้ว"),
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
                  else if(_passwordControl.text !=_re_passwordControl.text){
                    showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: new Text("Error!"),
                        content: new Text("Password Mismatch"),
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
                  }else{
                    Navigator.push(
                      context,
                     MaterialPageRoute(builder: (context) => LogInPage(email: _emailControl.text, password: _passwordControl.text)));
                  }
                },
              )
            ],
          ),
        )
      ),
    );
  }

}